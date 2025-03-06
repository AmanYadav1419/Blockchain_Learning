// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// in this contract write all the functions  
contract Calculator{
    
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
    
// we can acess all the contract code via creating its object instance
contract OtherContract1{
    Calculator obj = new Calculator(); //create calculator contract instance

    // function to return the whole contract obj
    function returnCalculatorObj() public view returns(Calculator) {
        return obj;
    }
}