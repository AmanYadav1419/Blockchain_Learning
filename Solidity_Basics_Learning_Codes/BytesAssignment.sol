// SPDX-License-Identifier: GPL-3.0
contract ByteExample {
    bytes1 public singleByte;
    bytes2 public twoBytes;

    constructor(){
        // Initialize singleByte with the ASCII code for the letter 'A'
        singleByte = 'A';
        // Initialize twoBytes with the ASCII code for 'B' and 'C'
        twoBytes = 'BC';
    }
    function updateSingleByte(bytes1 newByte) public {
        // update the value of singleByte with the proided byte
        singleByte = newByte;
    }
    function updateTwoBytes(bytes2 newBytes){
        // update the value of twoBytes with the provided bytes
        twoBytes = newBytes;
    }
}

// here are the questions with answers
// Q1. what is the initial value of singleByte in the ByteExample contract ?
// answer :- answer is 'A' and by hexadecimal value the answer is 0x41

// Q2. if the function updateSingleByte is called with the argument 0x42 (ASCII code for 'B'), what will be the new value ?
// answer :- answer is 'B' and by hexadecimal value the answer is 0x42

// Q3. what is the initial value of twoBytes in the ByteExample contract ?
// answer :- answer is 'BC' and by hexadecimal value the answer is 0x4243

// Q4 :- if the function updateTwoBytes is called with the argument 0x4445 (ASCII code for 'D' and 'E'), what wil be the new value ?
// answer :- answer is 'DE'

// the bytes are stored in hexadecimal form
// and they are store in storage