// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract newContract{
    // this below variable is state variable
    // as this stores in contract level
    uint public num1 = 5; // num1 - state variable

    function localVariableSetter() public pure{
        uint num2 = 10; //num2 - local variable
    }
}