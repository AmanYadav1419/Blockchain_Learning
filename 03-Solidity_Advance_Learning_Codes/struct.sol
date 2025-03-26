// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Struct {
    // declare the struct and variable name is Student.
    struct Student {
        string name; //default value :- ""
        uint roll; //default value :- 0
        bool pass; //default value :- false
    }

    // and the default value for all the data type present in struct Student will
    // be the default values of each data type , for string it will be "", for uint it will be 0, for bool it is false

    // and agar muhje iska data type banana hai to :-
    // initially s1 ki value hogi jo bhi struct ke andar ke data types ki dafault value hai wo. 
    Student public s1;

    // _name jo bhi varible ham function me pass karte hai wo generally underscore (_),
    //  se start kar ke aage vriable name.
    // it is not neccessary but ye ek good practise hai and it is a convention.
    // function to insert the data.
    function insert(string calldata _name, uint _roll, bool _pass) public {
        // to hame insert karna hai data , we can point out to specific data like this :-
        // the first method to run the first method uncomment the below three line codes.
        // s1.name = _name;
        // s1.roll = _roll;
        // s1.pass = _pass;
 
        // and instead of the above method we can also do like this
        // the second method to run the second method comment/uncomment the below line of code.
        // Student data type and in that stored all the required data , then this will get store to s1. 
        s1 = Student(_name, _roll, _pass);
    }

    // function to get the data.
    // yaha par returns me hamne Student esliye likha hai kyuki s1 ka data type Student hai
    // aur Student ek reference data type hai esliye memory likha hai.
    function getter() public view returns(Student memory) {
        return s1;
    }

    // function to get the particular data i.e name.
    // yaha par returns me hamne string esliye likha hai kyuki s1 ke data type me name ka data type hai string.
    // aur string ek reference data type hai esliye memory likha hai.
    function getterName() public view returns(string memory) {
            return s1.name;
    }
    
    // function to get the particular data i.e roll.
    // yaha par returns me hamne uint esliye likha hai kyuki s1 ke data type me roll ka data type hai uint.
    function getterRoll() public view returns(uint) {
            return s1.roll;
    }
    
    // function to get the particular data i.e pass.
    // yaha par returns me hamne bool esliye likha hai kyuki s1 ke data type me pass ka data type hai bool.
    function getterPass() public view returns(bool) {
            return s1.pass;
    }
}
