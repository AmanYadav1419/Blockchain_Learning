// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract String {
    // declaration syntax of string with example :-
    string public str = "hi";

    // string ko set karne ke liye function.
    // string memory esliye likh rahe hai kyuki function me ham
    // ek string ko pass kar rahe aur string ek state variable me declare kiya hai,
    // aur wo state variable ko ham _str me save ya function me pass kiya hai,
    // to read kar rahe hai na ki write kar rahe hai to "calldata" keyword ka use hoga.
    function setter(string calldata _str) public {
        // saving the _str value to str
        str = _str;
    }

    // string ko get karne ke liye function.
    // and returns me ham kya return kar rahe wo likha jata hai to string and memory 
    // because calldata ko ham returns me kabhi bhi nahi likhte hai.
    function getter() public view returns(string memory){
        // returning the value of str.
        return str;
    }
}
