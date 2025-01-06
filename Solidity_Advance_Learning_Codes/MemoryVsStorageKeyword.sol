// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// this file is for the difference between memory keyword vs storage keyword.

contract MemVsSto{
    // declare the fixed array named arr , i.e state variable.
    uint[5] public arr = [1,2,3,4,5];

    // let's create function to understand the storage keyword use and how it will work :-
    function StorageKeyword() public{
        // create a another array and just declare it with storage keyword
        uint[5] storage brr;
        // store the arr and its values to brr
        brr = arr; //brr acts as a pointer to arr, i.e changes happen in brr will also reflect to arr
        // so that we are pushing brr[0] = 6, that also change in arr and this is the state variable, 
        // so we are changing the values of state variable. 
        brr[0] = 6;
    }  

    // let's create function to understand the memory keyword use and how it will work :-
    function MemoryKeyword() public view{
        // create a another array and just declare it with memory keyword.
        uint[5] memory crr;
        // store the arr and its values to crr
        crr = arr; //crr will be the copy of arr , so that the changes happen in crr will not reflect to arr.
        // so if we update/change the values of crr, it doesn't reflect to arr it is not changing the values of state variable.
        crr[0]=6;
    }  
}