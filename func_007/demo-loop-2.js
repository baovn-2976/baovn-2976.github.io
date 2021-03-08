const sec_1 = a => 1 + a;
const add_1 = (a, b) => (b === 0) ? a : sec_1(add_1(a, b - 1));
const mpy_1 = (a, b) => (b === 1) ? a : add_1(a, mpy_1(a, b - 1));
// mpy(11,3) = 11 + mpy(11,2) = 11 + 11 + mpy(11,1) = 11 + 11 + 11 = 33

//console.log(mpy(11, 3)); // 33

const pwr_1 = (a, b) => (b === 1) ? a : mpy_1(a, pwr_1(a, b - 1));
console.log(pwr_1(2, 4));


//RangeError: Maximum call stack size exceeded


for (let a = 1; a < 10; a++) {
  for (let b = 1; b > 0; b++)
    try {
      pwr_1(a, b);
    } catch (stack) {
      console.log("bat loi " + stack + " tren " + a + "^" + b);
      break;
    }
  
 
}