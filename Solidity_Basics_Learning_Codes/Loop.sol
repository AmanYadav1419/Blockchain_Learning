// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Loop{
    // state variable
    uint public sum;

// syntax with example
    function LoopFunction() public {
        for(uint i = 0; i<10; i++){
            sum+= i; // sum = sum + i
        }
    }

    // syntax for while loop
    while(uint i = 10){
        // code to excute
    }

    // syntax for do while loop
    do{
        // do the code
    } while(uint i = 10);
}