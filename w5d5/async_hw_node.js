const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(callback) {
  let teaResponse, biscuitResponse;
  reader.question("would you like some tea? say 'do' or 'don't': ", (string) => {
    reader.question("what about some biscuits? say 'do' or 'don't': ", (string2) => {
      teaResponse = string;
      biscuitResponse = string2;
      callback(teaResponse, biscuitResponse);
    });
    
  });
}

teaAndBiscuits(function (tea, biscuit) {
  console.log(`So you ${tea} want tea and you ${biscuit} want biscuits.`);
  reader.close();
});