// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DAOorganization {
    // proposal struct to create complex data type
    struct Proposal {
        uint id;
        string description;
        uint amount;
        // why payable because issi address par ham ether send karne wale hai
        address payable receipint;
        uint votes;
        uint end; //end timing of proposals
        bool isExcuted;
    }

    // created mappings

    // mapping for checking address is investor or not
    mapping(address => bool) private isInvestor;

    // mapping for checking address having total numOfshares
    mapping(address => uint) public numOfshares;

    // nested mapping for one user konsi konsi id's par vote kar raha hai
    mapping(address => mapping(uint => bool)) public isVoted;

    // nested mapping for checking withdrawal staus
    mapping(address => mapping(address => bool)) public withdrawlStatus;

    // created a dynamic array of address for storing investorsList
    address[] public inverstorsList;

    // mapping for storing proposals
    mapping(uint => Proposal) public proposals;

    // global variables
    uint public totalsShares;
    uint public availableFunds;
    uint public contributionTimeEnd;
    uint public nextProposalId;
    uint public voteTime;
    uint public quorum; // it means minimum number of votes required
    address public manager;
}
