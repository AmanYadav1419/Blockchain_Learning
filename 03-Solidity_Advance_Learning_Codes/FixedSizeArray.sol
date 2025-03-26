// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FixedSizeArray{
    // array declaration syntax and code :-
    // all the values of arr1 is set to 0 , by default as the data type is uint.
    uint[5] public arr1;

    // array declartion and initialisation syntax and code :-
    // in this array[index] for arr2[3] and arr2[4] both the indexs are set to 0 
    // as this is the default value of uint
    uint[5] public arr2 = [1,2,3];

    // lets understand how we can insert the elements to array.
    function insertElement(uint index, uint element) public {
        arr2[index] = element;
    }

    // lets understand how we can return the elements to array.
    function returnElement(uint index) public view returns(uint) {
        return arr2[index];
    }

    // lets say agar puri ki puri array ko return karana hai
    // since hame ye bhi batana hogi ki ham array ko kaha use kar rahe hai ,
    // to yaha par ham array ko function me use kar rahe hai to hame returns me memory keyword likhna padega. 
    // memory keyword likhne se hamra contract ki visibility and simplicitiy baddh jatti hai.
    function returnAllElements() public view returns(uint[5] memory){
        return arr2;
    }

}