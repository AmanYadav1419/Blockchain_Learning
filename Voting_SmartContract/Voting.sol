// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Vote {
    // struct data for a voter, as a voter had many data for that struct is created
    struct Voter {
        string name;
        uint age;
        uint Voterid;
        string gender;
        uint voteCandidateId;
        address voterAddress;
    }

    // struct data for a candidate, as a candidate had many data for that struct is created
    struct Candidate {
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes; // number of votes candidate got
    }

    // then comes the election commission for them created a variable
    address electionComision;

    // this is for storing the address of winner, who won's the election
    address public winner;

    uint nextVoterId = 1; // voter ID fr voters
    uint nextCandidateId = 1; // Candidate ID for candidates

    uint startTime; // start time of election
    uint endTime; // end time of election

    // mapping for storing all the data of voters and candidates as well
    mapping(uint => Voter) voterDetails; // Details of voters;
    mapping(uint => Candidate) candidateDetails; // Details of candidate
    bool stopVoting; // this is for emergency situation to stop voting

    // constructor function , when smart contract get deployed this will call first.
    constructor() {}

    // created modifiers so that only the authoroised person can call the function
    // first modifier for checking is voting over or not
    modifier isVotingOver() {
        
        _;
    }

    // second modifier is for checking the only commisioner
    modifier onlyCommisioner() {
        
        _;
    }

    // function for candidate registering.
    function candidateRegister(
        string calldata _name,
        string calldata _party,
        uint age,
        string calldata _gender
    ) external {

    }

    // function for verification of candidate, and it will return bool value, like true or false for the candidate is verified or not
    function candidateVerification(address _person) internal view returns(bool) {

    }

    // function to return  all the candidates list.
    function candidateList() public view returns(Candidate[] memory){

    }

    
    // function for voter registering.
    function voterRegister(string calldata _name, uint _age, string calldata _gender) external {

    }

    // function for vote
    function vote(uint _voterId, uint _id) external {

    }

    // function for voteTime, which is only call by the election commisioner
    function voteTime(uint _startTime, uint _endTime) external onlyCommisioner() {

    }

    // function for checking the vote status
    function voteStatus() public view returns(string memory){

    }

    // function to declare the result of the election and which is only called by election commisioner
    function result() external onlyCommisioner() {

    }

    // function to stop the voting in an emergency case which is only called by election commisioner
    function emergency() onlyCommisioner(){
        
    }

}
