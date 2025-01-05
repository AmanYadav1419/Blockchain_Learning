// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Visibility{

// public visibillity specifier
    function f1() public pure returns(uint) {
        return 1;
    }
   
    // private visibility specifier
    function f2() private pure returns(uint) {
        return 2;
    }

    // internal visibility specifier
    function f3() external pure returns(uint) {
        return 3;
    }

    // external visibility specifier
    function f4() internal pure returns(uint) {
        return 4;
    }
}