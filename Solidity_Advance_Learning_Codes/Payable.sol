// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Payable {
    address public owner;

    function sendEtherToAddress(address reciver) public payable {
        // reciver yani address ko capable banana hai ethers send karne ke ya recive karne ke to
        // to hame usse payable banana padta hai.
        // and ether send karne ke liye transfer method ka use kar ke
        // msg.value global variable use kar ham ethers ko hold karte and send kar sakte ethers ko hai kar sakte hai in the form of numbers.
        payable(reciver).transfer(msg.value);
    }

    // function to send ethers to the contract itself
    // ye function ko call karne se hamare contract me ether add kar sakte hai
    function sendETHtoContract() public payable {

    }

    // and agar contract ka ether ka balance return karana ho ya dekhna ho
    // for that below function
    // ham returns(uint) me "uint" esliye likh rahe hai kyuki hamara function balance return kareg jo ki hai in number i.e is in "uint"
    // and view esliye kyuki ham data ko read kar rahe yani balance ko check means read kar rahe hai.
    function returnBalance() public view returns (uint) {
        // to basically return address
        // and this matalb ye contract ke liye
        // after that uska balance check ke liye .balance jisse ham balance jan sakte hai
        return address(this).balance;
        // balance esliye kyuki uss address ke pass kitne ether hai kitna balance hai wo return karne ke liye balance
        // and ye balance return karga in "wei" so hame isse convert karna hota hai jab ham decentralised application banayege tab
    }
}

// agar hame kisi address ko capable banana hai ethers send karne ke ya recive karne ke to
// to hame usse payable banana padta hai.

// and ham payable keyword ka use function me tabhi kar sakte hai
// jab wo function ko payable keyword se declare kiya ho ,
// otherwise ham function ke andar payable keyword ka use nahi kar sakte.

// to hota ye hai ki ek sender ethers ko send karta hai reciver ke pass jane ke liye ,
// lekin wo reciver ke pass jane ke pahele smart contract me jata hai then after that reciver ke pass jata hai.
// and ye process bhot fast hota hai.
// aur ye terminal me compiled ya trasnaction records me dekh sakte through remix ide me dekh sakte hai.
// smart contract ke pass jate hai ethers esliye hame functions ko bhi payable banana padta hai, function ke andar payable use karne ke liye.
