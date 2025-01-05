// write a Solidity smart contract that manages a List of numbers.
// The contract should allow the following functionalities :
// 1. Add/insert a number to the list.
// 2. Get the total count of numbers in the list. 
// 3. Get the numbr at a specific index in the list.
// 4. Replace a number from the list by its index.

// Make this program for both fixed size and dynamic

// here is the solution with fixed size array solved by aman myself :-
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FixedSizeArrayAssignment{
    uint[5] public arr;

    // add a number to the list
    function addNumberToList(uint index, uint element) public {
        arr[index] = element;
    }

    // get the total count of numbers present in array
    function totalCount() public view returns(uint[5] memory){
        return arr.length;
    } 

    // get the number at a specific index in the list
    function getNumberAtIndex(uint index) public view returns(uint) {
        return arr[index];
    }

    // replace the number from the list by its index
    function replaceNumber(uint index, uint number) public {
        arr[index] = number;
    }

}