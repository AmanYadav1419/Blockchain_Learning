// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// in this contract write all the functions  
contract Calculator{

    // state variable declaration
    address public manager;

    // now in this contract create a constructor function
    constructor(){
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
    
// we can acess all the contract code via creating its object instance
contract OtherContract1{
    // and ab hamare calculator contract ke pass constructor function hai to hame calculator contract ke instance ke liye i.e "calc"
    // now kyuki hamare constructor function me koi value pass nahi ho rahi hai to esliye Calculator ke instance me bhi ham koi value pass nahi kar rahe hai
    Calculator calc = new Calculator(); //create calculator contract instance

    // now we are acessing the address value by "calc" instance and storing to the manager variable.  
    address public manager = calc.manager();

    // and jab ham OtherContract ko deploy karenge tab hame manager variable ko dekenge tab
    // ham dekenge ki manager variable me OtherContract ka address store hoga
    // aur ye esliye kyuki OtherContract jab deploy hua tab instance create karne ke liye Calculator contract ko acess karna pada
    // and then sabse pahele constuctor function call hua aur constructor function kyuki OtherContract ne call karaya aur hamne function me bhi
    // yahi likha hai i.e msg.sender ki value manager me store hogi to OtherContract ka address manager me jake store ho gayi
    // kyuki OtherContract ne Calculator me present constructor function ko call karya.   

    // function to return the whole contract obj
    // uncomment the below function code to use it, currently comment out the code to focus on constructor function use  
    // function returnCalculatorObj() public view returns(Calculator) {
    //     return calc;
    // }
}