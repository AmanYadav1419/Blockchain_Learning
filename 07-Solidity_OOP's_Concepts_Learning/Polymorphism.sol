// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Demo_Polymorphism{
    // for the current , ham ek addition function bana lete hai, 
    // aur iss addition function me ham sirf 2 params pass kar rahe hai.
    function addition(uint a, uint b) public pure returns(uint){
        return a + b;
    }
    
    
    // but if agar me same function banata hu with same number of parameters to muhje error aayega
    // as we can't declare the function again with same name and same no. of paramters.

    // so for the polymorphism, ham ek aur parameter add karenge hamare function me.
    // here is the e.g 
    // after the function declaration with three parameters, then these two functions are treated as different, 
    // they are not same anymore, as the number of arguments are different.
     function addition(uint a, uint b,uint c) public pure returns(uint){
        return a + b + c;
    }

    // but sometime the function name and the number of arguments are same,
    // but the type of argumets are different , then also it will work
    // for e.g
    // in this no. of argumets are same with the same function name, but the type of argumets are different
    // so these are treated differently.
    function addition(uint a, string memory b) public pure returns(uint){
        return a;
    }
}