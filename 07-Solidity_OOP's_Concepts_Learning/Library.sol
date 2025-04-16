// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

    // to create our own library need to write the library keyword , followup with the name of library , we want to define.
    library Maths{
        // And consider in library we want to write some function , like this
        function addition(uint a, uint b) public pure returns(uint){
            return a + b;
        }
        
        // same with that we create more functions
        function substraction(uint a, uint b) public pure returns(uint){
            return a - b;
        }
        
        // same with that we create more functions
        function multiplication(uint a, uint b) public pure returns(uint){
            return a * b;
        }
        
        // same with that we create more functions
        function divison(uint a, uint b) public pure returns(uint){
            return a/b;
        }
    }

// so then let's say that i want to use this library 
// so we need to create a contract to use the library.

contract Library_Usage{
    // and i want to use Maths library for uint data types
    
    // here is the syntax of using Maths library we have created above
    using Maths for uint256;

    // so now by using one of function present in library, here is one of example
    function add(uint a, uint b) public pure returns(uint){
        // here is the use of library , below line of code show's it
        return a.addition(b); // this syntax is commonly used, as it doesn't need to write the library name again and again. 
    }

    // here is the one more example of using library with different syntax to use library code 
    function sub(uint a, uint b) public pure returns(uint){
        return Maths.substraction(a,b); // but now a days we are seeing very less use of this type of syntax 
    }

    // ye jo abhi uper ke codes work kar rahe hai, same esi tarah se hamari SafeMath library work karti hai
    // and yahi same syntax use hota hai , to use the library code , just vriaying the variable name but syntax is same     
}