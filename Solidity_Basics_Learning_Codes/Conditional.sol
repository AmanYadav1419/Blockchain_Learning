// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Conditionals {
    function check(bool value) public pure returns(uint) {
        if (value==true) {
            return 1;
        } else {
            return 0;
        }
    }
}
