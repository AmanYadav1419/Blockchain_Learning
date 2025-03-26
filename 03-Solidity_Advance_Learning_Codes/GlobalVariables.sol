// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GlobalVariables{
    // first global variable is :- block.timestamp

    // block.timestamp :- current block timestamp as seconds since unix epoch.
    // function to understand this 
    // returns(uint) me "uint" esliye hai kyuki timestamp uint me he return hota hai like this num :- 1736671009
    // and view esliye kyuki ham global variable ko read kar rahe hai.  
    // eska use hai jaha hame restrict karna hota hai kisi cheez ko for a particular time to ham eske through kar sakte hai
    // uncomment the below lines of code of function returnTime to run the block.timestamp code 
    function returnTime() public view returns(uint) {
        return block.timestamp;
    }

    // second global variable is :- msg.sender

    // msg.sender :- ye hame batata hai jisne function ko call kiya hai uska address 
    // function to understand this 
    // returns(address) me "address" esliye hai kyuki msg.sender hame caller ka address he return karta hai like this :- 0x542dfdsnd13something
    // and view esliye kyuki ham global variable ko read kar rahe hai.  
    // eska use :- ham esse ye pata kar sakte hai kis person ne function ko call karya hai and kya uske pass rights hai es function ko call karne ki.
    // uncomment the below lines of code of function callerAddress to run the msg.sender code
    function callerAddress() public view returns(address) {
        return msg.sender;
    }

    // third global variable is :- msg.value

    // msg.value :- ye hame batata hai ki kis bande ne kitne paise bheje gaye , in terms of paise isme "wei" hota hai.
    // function to understand this 
    // returns(uint) me "uint" esliye hai kyuki msg.value hame ye batata hai ki kisne kitne paise diye to wo numbers me hota hai 
    // esliye uint he return karta hai like this :- 10
    function ethSendByUser() public payable returns(uint){
        return msg.value;
    }

    // generally ham koi bhi transaction karte hai hamare smart contract me to wo "wei" me he hote hai, 
    // to agar ham "eth" bhi bheje to wo at the end convert ho jata hai "wei" ke terms me.
    // and in 1 eth me 10^18 wei hote hai.

}