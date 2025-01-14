// Assignment :-
// create a function that store the address, eth value and
// time of user who is calling the function
// function name be sendEth(), and there are multiple users who can acess this function
// so that it stores who is calling the function i.e user address, how many eth value sends and the time of function calling

// this assignment problem is solved using struct and array.

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GlobalvariableAssignment {
    // declaration of a Value struct to store multiple data to Value
    struct Value {
        address user;
        uint Ethvalue;
        uint time;
    }

    // declare the Value type to the variable in an array format 
    // so that multiple user can store the data , for that we need dynamic array
    Value[] public User;

    // function declaration and all the methods 
    function sendEth() public payable {
        User.push(Value(msg.sender, msg.value, block.timestamp));
    }

    // working of function :-
    // in User variable we store / push the differnt values like msg.sender, msg.value etc
    // msg.sender is used to store and obtain the address of user who call the function
    // msg.value is used to send the eth to the user or address or get the status of money/eth
    // block.timestamp is used to store the and obtain the time stamp of user calling the function 
}
