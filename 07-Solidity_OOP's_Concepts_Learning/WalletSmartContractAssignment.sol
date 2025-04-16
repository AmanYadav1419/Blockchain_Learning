// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

    // tasks for the Wallet Smart Contract Assignment :-
        // 1) The addres which will deploy the contract will become the owner of the wallet contract.
        // 2) Owner of the contract can send the ether to the any of eth EOA accounts.
        // 3) anyone can send the ether to the owner account address.
        // 4) owner of the contract can see the balance of it's own account.
        // 5) Also create one event which get emitted whenever owner recieve ether from some other EOA account.

contract WalletContractAssignment{
    address public walletOwner;
    uint private ownerAccountBalance;
    // 1st task 
    constructor(address _depolyerAddress){
        walletOwner = _depolyerAddress;
    }

    event Recived(address sender, uint256 amount);

    // 2nd task 
    function sendEthFromOwnerToEOA(address payable _reciever) public payable{
        // condition checking 
        require(msg.sender == walletOwner || msg.sender != _reciever, "Permission Denied")
        // remove the msg.value amount from wallet owner account. 
        ownerAccountBalance -= msg.value // confusion need to check it "+=" or "-="
        _reciever.transfer(msg.value);
    }

    // 3rd task 
    function sendEthFromEOAtoOwner() public payable{
        // and the wallet owner need to make it payable explicitly,
        // then after that transfer the ether value to the wallet Owner account
        payable(walletOwner).transfer(msg.value);
        // increment the owner account balance
        ownerAccountBalance += msg.value;
        // after that emit the event 
        emit Recived(msg.sender, msg.value)
    }

    // 4th task 
    function getOwnerAccountBalance() public view returns(uint){
        // condition checking 
        require(msg.sender == walletOwner, "You are not the Wallet Owner");
        // after that return the account balance.
        returns ownerAccountBalance;
    }
}