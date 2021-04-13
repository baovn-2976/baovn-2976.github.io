const puppeteer = require('puppeteer-core');
const download = require('image-downloader');
const fs = require('fs');
const express = require("express");



// buildPaths.js
const { buildPathHtml, buildPathPdf } = require('./buildPaths');

(async() => {
    const browser = await puppeteer.launch({
        
    //executablePath: '/opt/chrome/chrome.exe',
    //executablePath:'C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe',
    headless: false,
    slowMo:300,
    args: [
        //'--auto-open-devtools-for-tabs',
        '--disable-dev-shm-usage',
        '--no-sandbox',
        '--disable-setuid-sandbox'
    ]
    });

    
    // vào trang
    console.log('Browser openned');
    const page = await browser.newPage();
    // dịnh dạng khung cửa sổ hiển thị
   // page.setViewport({ width: 1280, height: 926 });
   try{
  const pageURL =  await page.goto('http://kenh14.vn/', {waitUntil: 'networkidle2', timeout: 0});
    console.log('Page loaded');
    console.log(`opened the page: ${pageURL}`);
   }catch(error){
       console.log(`failed to open the page: ${pageURL} with the error: ${error}`);
   }
   
   

    //chup hinh trang web
    await page.screenshot({path: 'kenh14-new.png'});


    // luu trang web duoi dang pdf
    const printPdf = async () => {
        console.log('Starting: Generating PDF Process, wait ..');
        await page.emulateMediaType('screen');
        const pdf = await page.pdf({
        format: 'A4',
        printBackground: true,
        margin: {
            top: "20px",
            bottom: "20px",
            left: "40px",
            right: "20px"
        }
        });
        return pdf;
    }

    // xử lý pdf
    const init = async () => {
        try {
            const pdf = await printPdf();
            fs.writeFileSync(buildPathPdf, pdf);
            console.log('Succesfully created an PDF page');
        } catch (error) {
            console.log('Error generating PDF', error);
        }
    };
    // run fuctions -> print pdf page
   // init();


     // tìm tất cả các title của trang hiện tại
     const articles = await page.evaluate(() => {
         console.log ('stating download title...');
        let titleLinks = document.querySelectorAll('h3.knswli-title > a');
        titleLinks = [...titleLinks];
        let articles = titleLinks.map(link => ({
            title: link.getAttribute('title'),
            url: link.getAttribute('href')
        }));
        return articles;
    });


    // lưu file dưới dạng JSon
    fs.writeFileSync(
        './articles.json',
        JSON.stringify(articles,null,2)
    ); 

  
    // In ra kết quả và đóng trình duyệt
    console.log('finish and display:');
    console.log(articles);


//======================== tìm kiếm và hiển thị trang ========================
    // tìm nút và click tìm kiếm
    await page.type('#searchinput','gai xinh');
    await page.click('.t-search-icon');

    await page.waitForNavigation({waitUntil: 'networkidle2'});
    // thực hiện tìm các tiêu đề ảnh
    function extractItems() {
     
          let imgLinks = Array.from(document.querySelectorAll('a.kscliw-ava > img')).map((img) => img.getAttribute('src'));
          return imgLinks;
        }


    // thực hiện cuộn trang
    async function scrapeInfiniteScrollItems(page, extractItems, itemTargetCount, scrollDelay = 100) {
        let items = [];
        try {
          let previousHeight;
          while (items.length < itemTargetCount) {
            items = await page.evaluate(extractItems);
            previousHeight = await page.evaluate('document.body.scrollHeight');
            await page.evaluate('window.scrollTo(0, document.body.scrollHeight)');
            await page.waitForFunction(`document.body.scrollHeight > ${previousHeight}`);
            await page.waitFor(scrollDelay);
          }
        } catch(e) { }
        return items;
    }
     // gọi thực hiện
     const items = await scrapeInfiniteScrollItems(page, extractItems, 100);

    // load on console
     console.log(items); 

    // Tải các ảnh này về thư mục hiện tại
    await Promise.all(items.map(imgUrl => download.image({
        url: imgUrl,
        dest: 'images'
    })));

//================================ click vào 1 đường dẫn sang trang mới và thu thập thông tin ====================
    // create new page chrome

    //save target of original page to know that this was the opener:     
    const pageTarget = page.target();
    //execute click on first tab that triggers opening of new tab:
    await page.click('ul.knsw-list > li:nth-child(5) > div.knswli-right > h3.knswli-title > a');
    //check that the first page opened this new page:
    const newTarget = await browser.waitForTarget(target => target.opener() === pageTarget);
    //get the new page object:
    const page2 = await newTarget.page();
    //page2 = await browser.newPage();

    console.log((await browser.pages()).length); // => 2
    //  console.log((await page2.content()));


    await page2.waitForSelector('.sp-img-zoom > img, .sp-img-lightbox > img, .detail-img-lightbox > img');
    //console.log((await page2.content()));
    const aHandle = await page2.evaluateHandle(() => document.body);
    console.log(aHandle);
    //await page2.waitForNavigation({waitUntil: 'networkidle2', timeout:0});



    // code tải ảnh trên trang --> đã chạy

    const imgLinks = await page2.evaluate(() => {
    let imgElements = document.querySelectorAll('.sp-img-zoom > img, .sp-img-lightbox > img, .detail-img-lightbox > img');
    imgElements = [...imgElements];
    let imgLinks = imgElements.map(i => i.getAttribute('src'));
    return imgLinks;
    });
    console.log(imgLinks);

     // Tải các ảnh này về thư mục hiện tại
     await Promise.all(imgLinks.map(imgUrl => download.image({
        url: imgUrl,
        dest: 'images'
    })));

    // code download all text-content on page    
    
    const pageContent = await page2.evaluate(() => {
        let contentText = Array.from(document.querySelectorAll('.knc-content')).map(content => content.innerHTML);
        return contentText;
        });
         
    // show result on terminal
    console.log('found the content: ', pageContent);
    // save file with .txt
    fs.writeFileSync('./contentPage.txt', pageContent.join('\n') + '\n');



    // await browser.close();
    setTimeout(async () => {
     await browser.close();
   }, 60000 * 4);


   // xong thì tắt ngay trình duyệt chrome
  // await browser.close();
  const app = express();
  const PORT = 4001;
   app.listen(PORT, () =>{
       console.log("app running on port 4000...");
   })

})();
