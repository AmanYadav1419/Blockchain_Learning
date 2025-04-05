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
        emit sendEthInformation(msg.sender, reciever, msg.value);
    }

    // to event ki jahag ky ham kuch dusre tarike se nahi kar sakte hai 
    // here is the example without using event and emit
    // so for returning mulitple values  we need to write each data type in returns, correponds to the data returning 
    function sendEth1(address payable reciver) public payable returns(address, address, uint) {
        reciver.transfer(msg.value);

        // here the another way to show the all the data, rather than using event emit
        // in solidity we can return multiple things at a time
        return(msg.sender, reciver, msg.value)
    }

    // to uper code se bhi sab work ho raha hai
    // to event ka kuch kamm hai kya , kuch useful hai kya ye questions aa sakte hai.
    // to kuch to use hoga
    // to sendEth and sendEth1 kya ye dono function same hai, to nahi ye bass dikhne me same lag rahe hai, but acutally both are different.
    // events jo hai wo kaffi useful hote hai, specially tab jab jab aap koi third party application jase ki koi external system hai,
    // jo ki ye detect kar raha hai ki smart contract me kuch hua ki nahi hua.

    // and events me logs hota hai , like jo bhi kuch hua hamne kiya uska ek log maintained hoga.
    // consider hamare smart contract ko hazaro log use kar rahe hai , to ham logs ke help ke through ye dekh sakte hai konse user ne kya kya kiya , 
    // kitne ether transfer kiye and all the other information jo ki log me store ho rahi hai.  
    // Hamara Gas cost kaffi bachta hai by using events so in comparing to returning some values in function with event and emit ,event emit required requires the less gas cost.
    // storage cost of events is also less, rather than storing storing historical data in state variables.

    // so in general the summary is there are three advantages of using events :-
    // 1. External system communication medium 
    // 2. Gas consumption
    // 3. Historical data
}