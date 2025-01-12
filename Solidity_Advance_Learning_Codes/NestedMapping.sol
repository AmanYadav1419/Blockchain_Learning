// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract NestedMapping {
    // syntax with the code to understand the nested mapping :-
    mapping(address => mapping(address => bool)) public ownership;

    // function to provide the ownership
    function provideOwnership(address sender, address receiver) public {
        // to store the data it like this 
        // the syntax with example 
        ownership[sender][receiver] = true;
        // that means sender receiver ko ownership de raha hai , as value bool is true
    }

    // function to take the ownership
    function takeOwnership(address sender, address receiver) public {
        ownership[sender][receiver] = false;
    }

    // function to check ownership , means return the ownership status
    // why in returns bool because ham return kara rahe hai bool value i.e true or false
    // yaha view esliye likha hai kyuki ham state variable ke data ko read kar rahe hai.
    function checkOwnership(address sender, address receiver) public view returns(bool){
        return ownership[sender][receiver];
    }
}