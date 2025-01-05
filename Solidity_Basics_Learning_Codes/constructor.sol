// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract constructorProgram{
    address public manager;
    // constructor ka syntax
    constructor(address user){
        manager = user;
    }
}