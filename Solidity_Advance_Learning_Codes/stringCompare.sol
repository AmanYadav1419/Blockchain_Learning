// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StringComparator{
    function compareString(string calldata s1, string calldata s2) public pure returns(bool){
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }
    // input -> hashing algortihm -> hash output.
    // keccak256 it is also like a sha256 algorithm for hashing , 
    // with the help of this we are comparing two strings hashes to each other. 
}