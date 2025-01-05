// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;


contract IntegerDataType{
    int8 public num1= 127; 
    // but the range is for int8 is -128 to 127,
    // it will get overflow, it will not accomodate the value 128 to to num1.

    uint256 public num2 = 256;
    uint8 public num3 = uint8(num2);

    // es me uint8 me sirf 255 takk ki range support hai, 
    // to agar me num2 ko typecase karta hu uint8 me to meri value 0 (zero) ho jayegi.

    // is tarah ki situation se bachne ke liye hamare pass ek library hoti hai jiska namm hai "safe math library"
}