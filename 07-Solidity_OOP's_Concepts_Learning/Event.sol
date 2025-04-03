// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Event_Demo{
    // to understand the event we will creating a simple function of sending ether to reciever.

    // but before that we will create the event
    // event is just like a function, we can't repeat the names declared 
    // here is the e.g, in this we can pass extra info i.e for getting knowledge of sender address. 
    event sendEthInformation(address sender, address reciever, uint amountSent);


    function sendEth(address payable reciever) public payable {
        reciever.transfer(msg.value);

        // to call the event we need to write "emit" keyword,
        // and after the event name with the data passed if arguments need to passed.
        emit sendEthInformation(msg.sender, reciever, msg.value) 
    }
}