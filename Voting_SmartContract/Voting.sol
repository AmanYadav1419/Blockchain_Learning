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
}
