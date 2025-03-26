// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MemoryVsCalldata{

    // meri ye array kaha pe store hai , on storage pe save hai.
    // because hamne array ko store karaya hai contract level pe aur 
    // kyuki ye state variable hai to ye storage par save hai.
    uint[5] public arr2 = [1,2,3]; 

    // let's understand the memory keyword with code example :-
    // now understand how to pass an array in function aur memory keyword kaha aur kese use karnege with code.
    // to basically hamne ek fixed size array function me pass ki , to hame pass karne ke badd batana hoga ki array kaha store hai,
    // array memory me store hai aur then array ka nam jo ki this case "num" hai
    // and in returns() hame basically ye batana hoga ki function kya return karega .
    // in this function ek fixed array return karega aur wo store hai memory me esliye memory keyword.
    // pure keyword esliye kyuki ham function me koi bhi state variable ko change ya read nahi kar rahe hai.
    
    function multiplyBy2Index0(uint[3] memory num) public pure returns(uint[3] memory){
        // num[0], the 0th index is get multiplied with 2 and store the value to the index 0
        num[0] = 2*num[0];
        return num;
    }

    // memory keyword in passing the argument ham tab use karenege jab ham apne array me koi changes karne wale hai
    // mutable agar array hoga ya rahega to ham "memory" keyword ka use karenge, but 
    // agar ham array ko bass read kar rahe hai koi changes nahi kar rahe hai function me pass karte time, 
    // to tab ham "calldata" keyword ka use karnege.
    
    // let's understand the calldata keyword with code example :-
    // basically ham es function me num array me koi changes nahi kar rahe hai.
    // and uske badd returns() me uint esliye likha hai kyuki return ham secondArray ko kar rahe hai aur uska data type hai uint.
    // pure keyword esliye kyuki ham function me koi bhi state variable ko change ya read nahi kar rahe hai.
    function passingArray(uint[3] calldata num) public pure returns(uint){
        uint secondArray = num[0];
        secondArray = secondArray*2;
        return secondArray;
    }

    // ham memory keyword ka use dono he case me kar sakte hai, lekin jaha par reference data me changes nahi kar rahe hai,
    // to waha par calldata likhne se , ham apni gas fees ya gas cost ko kam kar sakte hai.
    // returns() ke andar ham kabhi bhi calldata keyword ka use nahi karte, 
    // and agar ham kisi bhi reference data type ko ham returns() kara rahe hai tab hame memory keyword likhna padega

}