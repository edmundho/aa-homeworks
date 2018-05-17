function isPrime(number) {
  for (let i = 2; i < (number / 2) + 1; i++) {
    if (number % i === 0) {
      return false;
      break;
    }
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function firstNPrimes(n) {
  let primes = [];
  for (let i = 2; primes.length < n; i++) {
    if (isPrime(i)) {
      primes.push(i);
    }
  }
  return primes;
}

console.log(firstNPrimes(8));

function sumOfNPrimes(n) {
  let sum = 0;
  let primes = firstNPrimes(n);
  for (let i = 0; i < primes.length; i++) {
    sum += primes[i];
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));