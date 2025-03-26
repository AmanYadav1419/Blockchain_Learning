// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// to make the contract abstract write the "abstract" keyword before contract
abstract contract Abstract_Calculator{
    // after making abstract let's say hamne ek function bana liya
    function add(uint a, uint b) public pure returns(uint){
        return a + b;
    }

    // aur essi tarah se ham aur bhi function bana sakte hai
    function div(uint a, uint b) public pure returns(uint){
        return a / b;
    }

    // if we try to deploy the abstract contract it will give an alert message like this :- 
    // This contract may be abstract, it may not implement an abstract parent's methods completely or it may
    // not invoke an inherited contract's constructor correctly.

    // so basically we can't depoly the abstract contract, only we can use it by inheriting it.

    // so now understand the function without it's implementation concept.
    // to make the function without its implementation need to write "virtual" keyword.
    function sub(uint a, uint b) public virtual returns(uint);

    // aur essi tarah se ham aur bhi function without implementation bana sakte hai
    // like this

    function mul(uint a, uint b) public virtual returns(uint);

}

// to ye contract deploy to nahi ho sakta , to ham esse use kese kare
// hame abstract contract ko inherit kar sakte hai , taki ham contract function ko use kar sake
// let's see how, firstly inherit the abstract contract
contract Child is Abstract_Calculator {
    // to abstract_calculator ke functions ko use karne ke liye hamare pass 2 options hai
    // 1 - ya to ham Child contract ko bhi abstract contract bana de , by writing "abstract" keyword before contract.

    // 2 - ya to ham jo unimplemented functions abstract contract me present hai unhe implement kar de.

    // we are going with 2nd option , we are gonna implemenet the abstract contract functions 
    // that are not implemented in abstarct contract.
    
    // but for that we need to write "override" keyword to the functions need to implement in child contract.
    // kyuki hamne not implemented function's ko child contract me implement kiya esliye hame "override" keyword ka use karna pada.

    // the first function we are gonna implement. 
    function sub(uint a, uint b) public pure override returns(uint){
        return a - b;
    }

    // the second function we are gonna implement.
    function mul(uint a, uint b) public pure override returns(uint){
        return a * b;
    }

}