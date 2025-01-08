// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StringConcatenator {
    function concatenateStrings(string calldata s1, string calldata s2) public pure {
        // by using concat method we can add/merge the strings then return it.
        return string.concat(s1,s2);
    }
}