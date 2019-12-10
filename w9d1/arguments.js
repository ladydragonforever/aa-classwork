// // function sum(...args) {
// //     let ret = 0;
// //     // arguments = arguments.slice();
// //     for (let i=0; i < args.length; i++) {
// //         ret += args[i];
// //     }
// //     return ret;

// // }



// // console.log(sum(1, 2, 3, 4));

// // // Function.prototype.myBind = function() {
// // //     let that = this;
// // //     let firstargs = Array.from(arguments);

// // //     return function(){
// // //         let allargs = firstargs.concat(Array.from(arguments));
// // //         return that.apply(allargs[0],allargs.slice(1));
// // //     };
// // // }

// // Function.prototype.myBind = function(...args) {
// //     let that = this;
// //     return function(...args2) {
// //         debugger;
// //         // let allargs = args.concat(args2);
// //         // return that.apply(allargs[0], allargs.slice(1));
// //     }
// // }
// // class Cat {
// //     constructor(name) {
// //         this.name = name;
// //     }

// //     says(sound, person) {
// //         console.log(`${this.name} says ${sound} to ${person}!`);
// //         return true;
// //     }
    
// // }

// // class Dog {
// //     constructor(name) {
// //         this.name = name;
// //     }
// // }

// // const markov = new Cat("Markov");
// // const pavlov = new Dog("Pavlov");

// // markov.says("meow", "Ned");
// // // Markov says meow to Ned!
// // // true
// // // markov.says.bind(pavlov, "meow", "Kush")();
// // // bind time args are "meow" and "Kush", no call time args
// // // markov.says.myBind(pavlov, "meow", "Kush")();
// // // Pavlov says meow to Kush!
// // // true

// // // no bind time args (other than context), call time args are "meow" and "a tree"
// // markov.says.myBind(pavlov)("meow", "a tree");
// // // Pavlov says meow to a tree!
// // // true

// // // bind time arg is "meow", call time arg is "Markov"
// // markov.says.myBind(pavlov, "meow")("Markov");
// // // Pavlov says meow to Markov!
// // // true

// // // no bind time args (other than context), call time args are "meow" and "me"
// // const notMarkovSays = markov.says.myBind(pavlov);
// // notMarkovSays("meow", "me");
// // // Pavlov says meow to me!
// // // true



function curriedSum(numArgs){ 
    let numbers = [];
//    let _curriedSum = null;
//    _curriedSum = function(number) {
//     numbers = numbers.concat(number);
//         if (numbers.length === numArgs) {
//             return numbers.reduce((acc,el) => acc+el);
//         } else {
//             return _curriedSum;
//         }
//    };
   
    return const _curriedSum = function (number) {
        numbers = numbers.concat(number);
        if (numbers.length === numArgs) {
            return numbers.reduce((acc, el) => acc + el);
        } else {
            console.dir(_curriedSum);
            debugger;
            return _curriedSum;
        }
    };
    // return _curriedSum;
}

// // curriedSum(60) = func -> func() -> func()
// // curriedSum(60)(5)(63)(345)

let val1 = curriedSum(4);
let val2 = val1(5);
let val3 = val2(30);
let val4 = val3(20);
let val5 = val4(1);
console.log(val5);

// // const sum = curriedSum(4);
// // console.log(sum(5)(30)(20)(1)); // => 56


// Function.prototype.curry = function(numArgs){

//     let numbers = [];
//     let that = this;
//     return function _curry(number){
//         numbers = numbers.concat(number);
//         if (numbers.length === numArgs) {
//             return that(numbers);
//         }else {
//             return _curry;
//         }

//     };
// };

// function rando(num){
//     return num.length;
// }

// console.log(rando.curry(4)(5)(6)(7)(8));