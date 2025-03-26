// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Function_Contract{
    //code and state variables declare
    uint num1 = 10;
    uint num2 = 20;

 
 // ye function me na to state variable ko read kiya ja raha hai na to write kiya ja raha hai
 // esliye yaha pe pure likha hai
    function addition() public pure{
        // declare and initilzed a and b variables
        uint a = 10;
        uint b = 20;
        // declare variable c
        uint c;
        // store the addition of variable a and b
        c = a + b;
    }

    // es function me ham kuch value return karana chahte hai
    // to ham ek aur keyword ka use karte hai jo ki hai "returns(data_type_jo_return_karna_hai)"
    // () round brackets me ham likhte hai ki hame konsa data type me return karna hai
    // and ye keyword "returns" keyword batata hai ki kis tarah ka data_type return ho raha hai
    function subtraction() public pure returns(uint){
        uint a = 10;
        uint b = 20;
        // below return keyword return wase he work karta hai jase other programming language me hota hai
        return b-a;
    }

    // let's make the function who reads the data of state variables
    // view esliye likha gaya hai 
    // kyuki es function me ham state variables ki value ko read kar rahe hai 
    // hamare function pe depend karta hai ki wo hamare ,
    // state variables ke sath kis tarah ka relation rakh raha hai
    function multiplication() public view returns(uint){
        return num1*num2;
    }

    // one more function e.g data ko ham function me kese accept 
    // ya parameters ko kese accept karte hai
    // parameters pass karne ke liye ham parameter data_type and variable name dete hai
    // pure esliye kyuki ye function state variables se kuch ched-chad nahi kar raha hai
    function division(uint a, uint b) public pure returns(uint){
        return a/b;
    }

    // ye function me to state variable ko / me write kara ja raha hai
    // esliye yaha pe kuch likha nahi hai
    function changeState() public{
        // num1 jo hai wo state variable hai
        // aur usse waps write kiya ja raha hai
        // kyuki hamne state me change laya to esliye na ham pure aur na ham view ka use karenge.
        num1 = 100; // write
        uint b;
        uint b = num2; // read
    }
}