// ascending x
const count = (x = 0) => () => ++x;
const secC = count();
const addC = count();
const mpyC = count();
const pwrC = count(); 

// caculate
const sec = a => { 
  console.log('sec ' + secC()); 
  return 1  + a 
};
const add = (a, b) => { 
  console.log('add ' + addC());
  //return (b === 0) ? a  : sec(add(a, b - 1))
  if(b === 0){
   // console.log( a);
    return a ;
  }else{
    console.log('sec(add (' + a + ',' + (b-1) +')' + ')');
    return sec(add(a, b-1));
    
  }
  
};
const mpy = (a, b) => { 
  console.log('mpy ' + mpyC()); 
 // return (b === 1) ? a : add(a, mpy(a, b - 1))
    if(b === 1){
    //  console.log(a);
      return a;
    }else{
      console.log ('add('+ a +',' + 'mpy(' + a + ',' + (b-1)+ ')' +')');
      return add(a, mpy(a, b-1));
    }
 };
const pwr = (a, b) => {
   console.log('pwr ' + pwrC()); 
  // return (b === 1) ? a : mpy(a, pwr(a, b-1))
  if( b === 1){
   // console.log(a);
    return a;
  }else{
    console.log('mpy (' + a +',' + 'pwr (' + a + ',' + (b-1) + ')' + ')');
    return mpy(a, pwr(a, b-1));
  }
 }; 

console.log( pwr(2, 4)); 

