// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Modifier{
    uint public num = 10;

// syntax with example of modifier and with argument/parameter passing
modifier onlyValid(bool value){
    require(true==value, "Not Valid");
    num = 1;
    _;
    // underscore wala upper part ka jo code hai wo 
    // run karta hai aapke remaining line of code ko
    // jo ki hota hai jis function ko call kiya , in this case check1() function, similar with other function call
    // call hone par remaining code num = 100 excute hoga 
}

// and for calling the modifier ham simply function and public ke badd
// modifier function ko call kar dete hai
// like this
    function check1(bool value) public onlyValid(value){
        num = 100;
    }

// ham ase bhi modifier ko call kar sakte hai no issues
// lekin agar in future case me hame koi arguments pass karne hai to () brackets use karna padega.
    function check2(bool value) public onlyValid(value){
        num = 200;
    }

    // lets understand accpeting arguments / parameters to the function
    // with the syntax and example 
    function check3(bool value) public onlyValid(value){
        num = 300;
    }
}

// how modifier works :- 
// sabse pahele jab aap koi function ko call karenge tab wo function
// modifier ke pass jake excute hoga , and modifier me repeat hone wala code excute hoga
// then _; ye line of code ka meaning hai ki jo bhi reamaining line of code bacha hai excute hone ke liye
// in function call wo excute hoga