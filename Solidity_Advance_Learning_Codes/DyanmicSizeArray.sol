// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DyanmicSizeArray{

    // array declartion and initialisation syntax and code :-
    // dyanmic me basically ham koi length set nahi karte hai
    uint[] public arr = [1,2,3];

    // lets understand how we can insert the elements to array in dynamic array.
    // push method ye ensure karegi ki element add ya push ho jaye array  me
    // aur ye sab hoga sequence wise like pahele at 0th index, then 1st index , then 2nd index and so on
    function insertElement(uint element) public {
        arr.push(element)
    }

    // lets understand how we can return the elements to array.
    function returnElement(uint index) public view returns(uint) {
        return arr[index];
    }

    // one more thing present hoti hai in dyanamic array i.e pop an element
    // pop element me basically aapke array ke last element ko remove kiya jata hai
    // it start from last to first like , pahele 3rd index element remove , then 2nd index element remove and so on
    function removeLastElement() public {
        arr.pop();
    }

    // lets say agar puri ki puri array ko return karana hai
    // since ye dyanmic array hai to hame koi length nahi batana hoga ki ham array ko kaha use kar rahe hai ,
    // to yaha par ham array ko function me use kar rahe hai to hame returns me memory keyword likhna padega. 
    // memory keyword likhne se hamra contract ki visibility and simplicitiy baddh jatti hai.
    function returnAllElements() public view returns(uint[] memory){
        return arr;
    }

    // lets understand how we can return the length or size of array.
    function lengthOfArray() public view returns(uint){
        return arr.length();
    }

}