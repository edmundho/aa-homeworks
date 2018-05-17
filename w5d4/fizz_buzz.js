function fizzBuzz(array) {
  let result = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 15 === 0) {
      continue;
    } else if (array[i] % 5 === 0 || array[i] % 3 === 0) {
      result.push(array[i]);
    }
  }
  return result;
}


let arr = [2, 6, 8, 15, 18, 20, 30, 33, 37, 36, 45, 50, 54];
console.log(fizzBuzz(arr));