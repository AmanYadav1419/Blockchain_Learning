// Assignment :

// Create a smart contract named empolyeeRegistry that defines a struct Empolyee with the following properties :-

// uint256 id:- Empolyee ID.
// string name:- Empolyee Name.
// uint256 salary :- Empolyee Salary.

// Implement the following functionalities :- 
// allow adding a new empolyee to the registry using a function addEmpolyee that takes id, name, and salaray as parameters.

// Create a function getEmpolyee that takes an id as input and return's the empolyee's name and salary


// HERE IS THE SOULTION :- 

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

// create a contract named with empolyeeRegistry
contract empolyeeRegistry {
    // defines struct named Empolyee and in it write some properties.
    struct Empolyee {
        uint id;
        string name;
        uint salary;
    }

    // declaration of variable with struct as data type
    // instead declaring the size of array the array should be dynamic as we don't know the exact number of empolyee's
    // that are registred or get added.
    Empolyee[] public emp;

    // implementation of functionalities

    // function of addEmpolyee.
    function addEmpolyee(uint index, string calldata _name, uint _salary) public {
        emp[index].id = index;
        emp[index].name = _name;
        emp[index].salary = _salary;
    }
    
    // function of getEmpolyee
    // in returns we are not returning an entire array we just returning a single employee.
    // that's why we are writing Empolyee and as struct is a data type stored as memory.
    function getEmpolyee(uint index) public view returns(Empolyee memory){
        return emp[index];
    }
}