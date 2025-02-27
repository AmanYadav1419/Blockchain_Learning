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
        // check the condition for endTime and stopVoting
        require(endTime > block.timestamp && stopVoting != true, "Voting is Over now!!")
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
            // if present then throw the false
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
    ) external {
        // fistly we check the age of voter, should be 18+ , if not then throw the error.
        require(_age >= 18, "Age is Under 18");

        // then we check that if voter is already registerd or not
        require(voterVerification(msg.sender), "You had already registerd");

        // if these conditions pass then store the voter data to Voter mapping
        // so we are pushing the data in an very secured and efficient way i.e in objects
        voterDetails[nextVoterId] = Voter({
            name: _name,
            age:_age,
            gender:_gender,
            Voterid:nextVoterId, // the voter address is on the nextVoter id, which is unique.
            voterAddress:msg.sender // the voter who call's the function is directly store as the voter address. 
        });

        // then after storing the voter details , increment the nextVoterId
        nextVoterId++;
    }

    // function for voter verification status check
    function voterVerification(address _person) internal view returns(bool){
        for(uint voterId = 1; voterId<nextVoterId;voterId++){
            // then we check if the voterP is present or not 
            // if present then throw the false
            if(voterDetails[voterId].voterAddress == _person){
                return false;
            }
        }

        // after loop excutes return true, that means everything is alright
        return true;
    }

    // function to return all the voters 
    function voterList() public view returns(Voter[] memory){
        // created a array to store the mapping details, as we can't return mapping inside the function
        // created VoterArr upto the length of nextVoterId
        Voter[] memory VoterArr = new Voter[](nextVoterId - 1);

        // loop to the Voter mapping and store the data to the VoterArr
        for(uint i = 1; i < nextVoterId; i++){
            // as array indexing start from 0, so that's why there is i - 1, for array only
            // and as the voterDetails this is mapping starting from 1, that's why
            VoterArr[i - 1] = voterDetails[i]; // transfering data from mapping to array
        }
        // then return the array of voters
        return VoterArr;

    }


    // function for vote
    // this accepts two params _voterId and _candidateId <- to whom voter is voting to candiate.
    // with that it check the isVotingOver modifier, if it returns false then the function will not excute 
    function vote(uint _voterId, uint _candidateId) external isVotingOver() {
        // this function should includes this topic as well
        
        // the first is check is that the voter is valid or not,
        // if not then throw the error and revert back
        require(voterDetails[_voterId].voterAddress == msg.sender, "You have not registered for Voting!!");

        // check condition for candidateId is valid or not
        require(_candidateId > 0 && _candidateId < 3, "Candidate Id is not Valid!!")

        // vote should be allowed when voting is started
        require(startTime != 0, "Voting has not Started Yet!!");

        // voting should only happen when two candidates are registred
        // nextCandidateId is currently 3 , as two candidates registerd , so the current id is 3.
        require(nextCandidateId == 3,"not enough Candidates Registerd!!")
        
        // one vote one voter
        require(voterDetails[_voterId].voteCandidateId == 0, "Voter has already Voted!!");

        // then after each require statment passes , the voter can vote to the candidate
        voterDetails[_voterId].voteCandidateId = _candidateId;

        // after that increment the candidate votes by 1.
        candidateDetails[_candidateId].votes++;
    }

    // function for voteTime, which is only call by the election commisioner
    function voteTime(
        uint _startTime,
        uint duration // kitne ghante tak voting time ko shuru rakhna hai i.e duration 
    ) external onlyCommisioner {
        // as the time is from unix time that is running from 1 jan 1970
        // suppose start time is like for eg. 4 PM
        startTime = _startTime;
        // the end time will be the addition of start time and duration
        // and for end time the duration is 2 hours, so end time is 4 PM + 2 Hours = 6 PM;
        // for 2 hours i.e 2*60*60 = 3600
        endTime = _startTime + duration;

    }

    // function for checking the vote status
    function voteStatus() public view returns (string memory) {
        // agar hamara start time zero(0) hai to matalb voting shuru nahi hui hai
        if(startTime == 0){
            return "Voting is Not Started Yet!!";
        }
        // and endtime block.timestamp se bada hai that means voting shuru hai.
        // and jo stopVoting hai wo true na ho to else if condition run ho jayega.
         else if(startTime != 0 && endTime > block.timestamp && stopVoting != true){
            return "Voting is in Progress!!";
        }
        // and agar uper ke conditions bhi nahi hai, that's means voting end ho gayi hai
        else{
            return "Voting has Ended!!";
        }
    }


    // function to declare the result of the election and which is only called by election commisioner
    function result() external onlyCommisioner {
        // create a variable max to store the maximum number of votes
        uint max = 0;

        // created a loop to iterate through all the candidates votes
        for(uint i = 0; i < nextCandidateId; i++){
            // check condition
            if(candidateDetails[i].votes > max){
                // if vote count is greater than max , then store the votes to max 
                max = candidateDetails[i].votes;

                // and then store the candidate address to the winner variable, to declare the winner
                winner = candidateDetails[i].candidateAddress;
            }
        }
    }

    // function to stop the voting in an emergency case which is only called by election commisioner
    function emergency() onlyCommisioner {
        // for stoping the voting in an emegerncy case , we can use stopVoting variable i.e bool value
        stopVoting = true; 
    }
}


// server side :-
// registration and voting date check at server side
