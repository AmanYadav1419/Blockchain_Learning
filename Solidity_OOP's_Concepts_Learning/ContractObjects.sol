// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// this below contract is for the contract and object
contract Storage{

    // global/state level variable
    uint256 number = 2;

    // first function to store the number
    function store(uint num) public {
        number = num;
    }

    // second function to return/retrive the number
    function retrive() public view returns(uint){
        return number;
    }
}

// now we will acess this contract via creating it's object
// for this create new contract
contract OtherContract{
    // below this is the syntax with implementation.
    // getting all the data , details of contract "Storage" to variable "obj"
    
    Storage obj = new Storage(); // created Storage contract instance 

    // now with the help of "obj" we can acess all the function present in contract Storage
    // let's see how we can acess "Storage" function in this contract with "obj"

    function returnValue() public view returns(uint){
        return obj.retrive();
    }
}