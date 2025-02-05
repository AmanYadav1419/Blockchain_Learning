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
    uint public totalShares;
    uint public availableFunds;
    uint public contributionTimeEnd;
    uint public nextProposalId;
    uint public voteTime;
    uint public quorum; // it means minimum number of votes required
    address public manager;

    // constructor function , that will excute immedeitely when contract deloyed
    constructor(uint _contributionTimeEnd, uint _voteTime, uint _quorum) {
        // condition checking for _quorum value must be greater than 0 percent
        // and less than 100 percent , so that this will range from 1 to 100
        require(_quorum > 0 && _quorum < 100, "Not valid values");

        // then initilaized the state variables
        // contributionTimeEnd tab he start hoga jab contract deploy hoga i.e
        // block.timestamp se deployed time plus jo time hamne diya hai , unka addition kar ke variable me store hoga.
        // all this is in unix timestamp
        contributionTimeEnd = block.timestamp + _contributionTimeEnd;
        voteTime = _voteTime;
        quorum = _quorum;
        // jo bhi smart contract ko depoly kargea wahi address manager me assign ho jayega.
        manager = msg.sender;
    }

    // modifier for checking address is investor or not
    modifier onlyInvestor() {
        // checking that isInvestor msg.sender is equal to true or not
        // if not throw the error of not an investor
        require(isInvestor[msg.sender] == true, "You are not an Investor");
        _;
    }

    // modifier for checking address is manager or not
    modifier onlyManager() {
        // checking that manager address is equal to msg.sender or not
        // if not throw the error of not a manager
        require(manager == msg.sender, "You are not a Manager");
        _;
    }

    // function for contribution of investors
    // this is payable function because in this we are sending ethers
    function contribution() public payable {
        // contributionTimeEnd is greater or equal to block.timestamp i.e current time so that investor will contribute
        // if current time is greater than contributionTimeEnd then throw the error
        require(
            contributionTimeEnd >= block.timestamp,
            "Contribution Time Ended"
        );

        // condition for checking the ether sending is greater than 0, then only ether will get send
        // else throw te error
        require(msg.value > 0, "Send More than 0 ether");

        isInvestor[msg.sender] = true;
        // jo bhi ether value convert hoke wei me hoga wo numOfshares me aa jayega.
        numOfshares[msg.sender] = numOfshares[msg.sender] + msg.value;

        // also increase the total shares 
        totalShares += msg.value; // totalsShares = totalsShares + msg.value

        // also increase the avaiable funds
        availableFunds += msg.value;

        // and because we got investor , so we push the investor to the dyanmic array
        inverstorsList.push(msg.sender);
    }
}
