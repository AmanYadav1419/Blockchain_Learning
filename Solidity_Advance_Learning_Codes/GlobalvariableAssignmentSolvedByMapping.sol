// Assignment :-
// create a function that store the address, eth value and
// time of user who is calling the function
// function name be sendEth(), and there are multiple users who can acess this function
// so that it stores who is calling the function i.e user address, how many eth value sends and the time of function calling

// this assignment problem is solved using struct and mapping.

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GlobalvariableAssignmentByMapping {
    // declare The struct variable i.e User and in that data types of required data types
    struct Users {
        uint256 balance;
        uint256 timeStamp;
    }

    // store the struct or assign the key and value pair in mapping.
    // and then store it on the variable user.
    mapping(address => Users) public users;

    // create a function of sendETH
    function sendETH() public payable {
        // first method to store the data, easy for beginner to understand the data
        // for getting the eth value from user
        users[msg.sender].balance = msg.value;

        // for getting the time stamp 
        users[msg.sender].timeStamp = block.timestamp;

        // uper line ke code ko ham ek line me bhi likh sakte the like this the second approach :-
        // to excute this line code below line of code ko uncomment karo and uper ke code ko comment karo
        // users[msg.sender]=Users(msg.value, block.timestamp);

        // otherwise the third approach to send the data is in key value pair i.e is in objects
        // uncomment below line of codes to excute this method and commenting above two approaches to store the data.
        users[msg.sender] = Users({
            balance: msg.value,
            timeStamp: block.timestamp
        });
    }

    // functionn to get the user details and values
    // as we are reading the state variable data so that we are writing view
    // and in returns uint256 , uint256 because the data store in struct is data type in uint256
    // in this function we are accepting the user address from that address we can get/fetch the details.
    function getUserDetails(
        address userAddress
    ) public view returns (uint256, uint256) {
        // and returning the user details after getting user address as a parameter.
        // and we can return multiple data in solidity by comma (,) to seperate out the data.
        return (users[userAddress].balance, users[userAddress].timeStamp);
    }
}

// by using mapping we are getting and storing the data in more convient way,
// as array me extra parameter add ho raha tha jo tha index value, ham index value se store ya return kara sakte hai
// and hamara users ka address to contionus sequenece me to nahi hoga to esliye mapping me index parameter add nahi hota
// just simply user details store karne ke liye user ke address se ho jayengi
// and get karne ke liye user address dal ke sari details data aa jayenge.
