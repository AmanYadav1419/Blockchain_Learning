// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract requireStatment{
    
    // let's understand this by example

    // valid ki value by default false hoti hai 
    bool public valid;

    function isEven(uint a) public {
        valid = true;
        require(a % 2 == 0, "a is an odd Number");
    }

    // now agar me function call karte time agar me 4 pass karta hu
    // to 4 to even hai to a % 2 == 0 ye true ho jayega aur 
    // agli line of code excute ho jayegi , jo hai state variable ko write karna i.e valid = true
    // and agar false ayya to ye error throw hoga - "a is an odd Number" ye ayega 
    // because false hone par revert back hota hai and error message atta hai. 


    // revert back matalb jab value i.e a % 2 == 0 ye false hui aur usne error throw kiya , 
    // i.e "a is an odd Number" to jo cheeje uper se leker niche tak hui thi usko roll back kar diya
    // roll back yani ham valid ki initial value/state par aa gaye, jo bhi changes kiye the wo sab 
    // usne initial value/state par aa gaye, jo bhi uss function ke andar hua hoga sirf wahi revert back hoga 
}

// condition checking
    // true - next line of codes move on
    // false - revert back and we throw error
    