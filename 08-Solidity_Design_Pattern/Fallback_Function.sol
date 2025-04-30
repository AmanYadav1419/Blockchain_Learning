// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Fallback_Function_Contract {
    // declaring state variable.
    // definately the initial value of num is 0 (zero).
    uint public num;

    function addition() public{
        num = 1
    }

    function substraction() public{
        num = 2
    }
    // - how the fallback function works , here is the guide :- 
	// 1) sabse phele compile kar lete hai smart contract ko , 
	// 2) then click on compilation details.
	// 3) then there is an option of "FUNCTIONHASHES", click on it , then it shows the hashes of function with all functions present in the smartcontract. hash are get from SHA256, copy any of the function hash.
	// 4) to basically fallback function tab call hota hai, jab aapke contract ka koi bhi function call nahi hota hai. 
        // to basically ye possible hai with the help of "low level interaction" in solidity.
	// 5) low level interaction karne ke liye, ham jayenge depoly section me , after depolying smart contract,
        //  in that below there is a section named "Low level interactions" , so in that ham hash function ko paste karenge.
	// 6) but wo excute karne ke liye hame hamare code me fallback function defined karna padega , 
        // otherwise it will give an error " 'Fallback' function is not defined ".
    // 7) agar ham low level interaction kar rahe hai, and hamare functions me data pass ho rahe hai to specific function ko call karte samay hame low level interaction me data pass karna padega., 
        // so that's why make some changes removed the data passed in the function
    // 8) to call with the low level interaction , with the function hash , we must need to write "0x" before the function hash.
	// 9) so agar by mistake hash function ko low level interaction me paste karte samay kuch mistake hui to waha pe hamara asa koi function ,
        // to exist nahi karta tab yahi pe hamara fallback function excute hota hai. and the transaction will be succesful 
        // but fallback function wil be excuted and which ever is written in code present in fallback function will work.
    // 10) fallback sirf low level par he call kar sakte hai asa nahi , it can work on high level also. 
    
    // here is the fallback function code
    
    fallback() external {
        // making changes in state variable, when fallback function is called.
        num = 3;
    }
}
