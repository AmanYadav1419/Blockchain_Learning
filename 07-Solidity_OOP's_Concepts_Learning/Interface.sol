// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// to create interface we need to write "interface" keyword first 
interface Interface_Calculator{
    // so in interface we need to make sure each function is declared must be an external function.
    // Interface functions are implicitily "virtual", no need to write "virtual" keyword in function declaration.
    // here is the e.g and we can write as many of function declaration as we want
    function addition(uint a, uint b) external returns(uint);
    function subtraction(uint a, uint b) external returns(uint);
}

// now we can inhert the interface by using keyword "is", like this :-
contract Owner is Interface_Calculator{

    // and if you see we don't need to write the override keyword as well in interface
    // it is also done implicitily by solidity itself.

    // and yes we are not dealing with state variable so must write "pure" keyword in function declaration.
    
    function addition(uint a, uint b) pure external returns(uint){
        return a + b;
    }

    // and yes we can also change the external behaviour of the function to "public" only.
    // only in inherited we can change the function scope from "external" to "public" but not in other like "private" and etc. 
    // but in interface we must need to write the "external" keyword to use this function and contract error free. 
    function subtraction(uint a, uint b) pure public returns(uint){
        return a - b;
    }


}