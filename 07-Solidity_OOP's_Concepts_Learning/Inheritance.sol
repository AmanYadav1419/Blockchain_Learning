// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Parent{
    // in solidity the constructor function is also get inherited to the inherited contract 
    // here is the example
    
    // state variable declaration of type address
    address public manager;

    // this function is also get inherited in child contract with the state variable
    constructor(){
        // and storing msg.sender address to manager variable
        manager = msg.sender;
    }

    function add(uint a,  uint b) public pure returns(uint){
        return a + b;
    }
    
    function sub(uint a,  uint b) public pure returns(uint){
        return a - b;
    }
    
    function mul(uint a,  uint b) public pure returns(uint){
        return a * b;
    }
    
    function div(uint a,  uint b) public pure returns(uint){
        return a / b;
    }
}

// Parent contract ke sare functions ko use karne ke liye kisi dusre contract me 
// hame Parent contract ko inherit karna padega aur inherited contract me ham chaiye to new functions add kar sakte hai

// so agar hame koi contract ko inherit karna hai to ham "is" keyword ka use karte hai, in solidity
// like here is the syntax with example
// to like check karna ho to child me kuch bhi nahi likha hai , after deploying child contract tabhi bhi ham 
// parent contract ke functions ko acess and use kar sakenge.

contract Child is Parent{
    // so suppose ab ham kuch aur functions add karna chahte hai to ham kar sakte hai
    // to Child contract ke function sirf child contract he acess kar sakta hai parent contract nahi kar sakta
    // lekin parent contract ke functions child contract acess kar sakta hai kyuki child conntract ne parent contract ko inherit kiya hai
    // parent contract ne child contract ko inherit nahi kiya hai.

    // below function to check the number is even or not , if even return true else return false.
    function isEven(uint _number) public pure returns(bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
}