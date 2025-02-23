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
    constructor() {
        // the address who deploy the contract , their address will store in electionComision variable
        electionComision = msg.sender;
    }

    // created modifiers so that only the authoroised person can call the function
    // first modifier for checking is voting over or not
    modifier isVotingOver() {
        _;
    }

    // second modifier is for checking the only commisioner
    modifier onlyCommisioner() {
        // we are checking the address who call's the function is equal to the electionComision address
        // if not then throw the error of You are not from Election Commision.
        // and if it is true then just excute next line, and it will stop working as in next line we are breaking the function.
        require(
            electionComision == msg.sender,
            "You are not from Election Commision"
        );
        _;
    }

    // function for candidate registering.
    function candidateRegister(
        string calldata _name,
        string calldata _party,
        uint _age,
        string calldata _gender
    ) external {
        // before registration we can check things like age,
        require(_age >= 18, "Age is Under 18");

        // and for checking that the candidate is not get register for the second time, prevent them for registering multiple time.
        require(
            candidateVerification(msg.sender),
            "You have already registerd"
        );

        // just to make simple to understand, we only take two candidates for now
        // for this we are creating required statment
        // if candidate id is gretaer than count three it will throw an error
        require(nextCandidateId < 3, "Candidate registration full!")

        // so we are pushing the data in an very secured and efficient way i.e in objects
        candidateDetails[nextCandidateId] = Candidate({
            name: _name,
            party: _party,
            age: _age,
            gender: _gender,
            candidateId: nextCandidateId, // the candidate address is on the nextcandidate id , which is unique.
            candidateAddress: msg.sender //the candidate who call's the function is directly store as the candidate address
        });

        // then after storing the candidate details , increment the nextCandidateId
        nextCandidateId++;
    }

    // function for verification of candidate, and it will return bool value, like true or false for the candidate is verified or not
    function candidateVerification(
        address _person
    ) internal view returns (bool) {
        // we run the loop to check all the candidates that are present 
        for(uint candidateId = 1; candidateId < nextCandidateId; candidateId++){
            // then we check if the canidate is present or not 
            // if present then throw the error
            if(candidateDetails[candidateId].candidateAddress == _person){
                return false;
            }
        }
        // after loop excutes return true, that means everything is alright
        return true;
    }

    // function to return  all the candidates list.
    function candidateList() public view returns (Candidate[] memory) {
        // as we can't return the mapping inside the function , so we need to store the mapping to array
        // and then we can simply return the array i.e copy of mapping
        // upto the size of nextCandidateId but suppose we have candidates raju and priti, so size should be 2 not 3, that's why 
        // there is nextCandidateId - 1
        Candidate[] memory candidateArr = new Candidate[](nextCandidateId - 1);

        // now create the loop to iterate and store the mapping to array
        for (uint256 i = 1; i < nextCandidateId; i++) {
            // as array indexing start from 0, so that's why there is i - 1, for array only
            // and as the candidateDetails this is mapping starting from 1, that's why
            candidateArr[i - 1] = candidateDetails[i]; // transfering data from mapping to array. 
        }

        // after loop excution return the array
        return candidateArr;

    }

    // function for voter registering.
    function voterRegister(
        string calldata _name,
        uint _age,
        string calldata _gender
    ) external {}

    // function for vote
    function vote(uint _voterId, uint _id) external {}

    // function for voteTime, which is only call by the election commisioner
    function voteTime(
        uint _startTime,
        uint _endTime
    ) external onlyCommisioner {}

    // function for checking the vote status
    function voteStatus() public view returns (string memory) {}

    // function to declare the result of the election and which is only called by election commisioner
    function result() external onlyCommisioner {}

    // function to stop the voting in an emergency case which is only called by election commisioner
    function emergency() onlyCommisioner {}
}
