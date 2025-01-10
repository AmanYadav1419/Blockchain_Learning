// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract ArrayofStruct {
    // declare the struct and variable name is Student.
    struct Student {
        string name; //default value :- ""
        uint roll; //default value :- 0
        bool pass; //default value :- false
    }

    // and the default value for all the data type present in struct Student will
    // be the default values of each data type , for string it will be "", for uint it will be 0, for bool it is false

    // and agar muhje iska data type banana hai to :-
    // initially s ki value hogi jo bhi struct ke andar ke data types ki dafault value hai wo.
    Student[5] public s;
    // and ye Student ke badd ke array ke brackets me jo value hai wo hai size of the array.

    // function to insert data in array of structs by specific index.
    function insert(
        uint index,
        string calldata _name,
        uint _roll,
        bool _pass
    ) public {
        // to hame insert karna hai data wo bhi specific index par, we can point out to specific data like this :-
        s[index].name = _name;
        s[index].roll = _roll;
        s[index].pass = _pass;
    }

    // function to get the all data.
    // yaha par returns me hamne Student[5] esliye likha hai kyuki s ka data type Student hai aur wo bhi array of structs hai.
    // aur Student ek reference data type hai esliye memory likha hai.
    // and jo reamining data slots present hai array me agar unke index me koi value insert nahi hoti hai to unki by default
    // value par wo set ho jatti hai
    function getter() public view returns(Student[5] memory) {
        return s;
    }

}
