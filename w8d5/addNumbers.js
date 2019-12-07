const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum,numsLeft, completionCallback){
    if (numsLeft === 0) {completionCallback(sum);
    // let partialSum = 0;
    reader.close();
    }
    if (numsLeft > 0) {
        reader.question('Enter a number: ', (res) => {
              
            sum += parseInt(res);
            console.log(sum);
        });
        addNumbers(sum, numsLeft-1, completionCallback);
       
        // console.log("test");
        
    }
}
// reader.close();  

// const cb = (num) => { return num+1; };
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));