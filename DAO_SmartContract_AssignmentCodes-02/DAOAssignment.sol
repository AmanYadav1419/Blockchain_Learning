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
    // mapping(address => mapping(address => bool)) public withdrawlStatus;

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

    // function reedem share that means koi bhi investor apne shares ke amount ko fetch kar sakta hai
    // ye sirf aur sirf investor he call sakta hai, kyuki jisne invest kiya wahi reedem kar sakta hai
    function reedemShare(uint amount) public onlyInvestor(){
        // sabse pahele ham check kar rahe hai investor ke num of shares ka amount input amount se jyda hai ya nahi
        // greater hai then excute karo otherwise error throw karo
        require(numOfshares[msg.sender] > amount, "You Don't Have Enough Shares") 
        // then agar hamre funds jo use ho gaye hai usse bhi jyda amount ki requirement aa rahi hai, then
        // agar funds avaiable hai to excute hogi next line, else throw error
        require(availableFunds > amount, "Not Enough Funds");

        // then we deduct the the amount from the msg.sender
        numOfshares[msg.sender] -= amount;

        // then ham check karenge ki kya investor ne apne sare shares nikal liye hai kya
        if(numOfshares[msg.sender]==0){
            // then wo investor he nahi rahega, agar ussne sare shares nikal liye hai to
            inverstorsList[msg.sender] = false;
        }

        // then ham avaialble funds se amount ko minus kar lenge taki avaiable funds status update
        availableFunds -= amount;

        // then ham amount ko msg.sender ke address me transfer kar denge 
        // lekin transfer method ham tabhi use kar sakte hai jab wo address payable ho
        // to iske liye ham explict type casting karenge
        payable(msg.sender).transfer(amount); //transferring of ether
        
    }

    // investor's address share's will get transfered "to" address
    function transferShares(uint amount, address to) public onlyInvestor(){
        // sabse pahele ham check kar rahe hai investor ke num of shares ka amount input amount se jyda hai ya nahi
        // greater hai then excute karo otherwise error throw karo
        require(numOfshares[msg.sender] >= amount, "You Don't Have Enough Shares");
       
        // then agar hamre funds jo use ho gaye hai usse bhi jyda amount ki requirement aa rahi hai, then
        // agar funds avaiable hai to excute hogi next line, else throw error
        require(availableFunds > amount, "Not Enough Funds");

        // then we deduct the the amount from the msg.sender
        numOfshares[msg.sender] -= amount;

        // then ham check karenge ki kya investor ne apne sare shares nikal liye hai kya
        if(numOfshares[msg.sender]==0){
            // then wo investor he nahi rahega, agar ussne sare shares nikal liye hai to
            inverstorsList[msg.sender] = false;
        }

        // then ham avaialble funds se amount ko minus kar lenge taki avaiable funds status update ho jaye
        availableFunds -= amount;

        // aur then wahi amount ko ham "to" address me update kar deneg
        numOfshares[to]+= amount;

        // ab "to" bhi ek investor ban gaya hai kyuki uske pass kuch na kuch shares aa he gaye
        isInvestor[to] = true;
        // then ham "to" investor ko bhi investorList me append kar denege
        inverstorsList.push(to);
    }

    // function to create proposals i.e is only call by manager
    function createProposals(string calldata description, uint amount, address payable receipint) public onlyManager() {
        require(availableFunds >= amount, "Not Enough Funds");

    // in proposals mapping we store the Proposal Struct data 
    // so that it will create a proposal

    // 0 for initial vote count, and for end time we can do block.timestamp + voteTime so it will give us end time
    // and as this is created a proposals so at first stage isExcuted is false
        proposals[nextProposalId] = Proposal(nextProposalId,
        description,
        amount,
        receipint,
        0, 
        block.timestamp+voteTime,
        false
        );

        // then next proposal id ko increament kar diya taki next proposal jo ho wo unique ho
        nextProposalId++;
    }

    // function for creating vote proposal , jiske through ham vote kar sakte hai
    // and iss function ko sirf aur sirf investor he call kara sakta hai, yani ki only investor can vote
    function voteProposal(uint porposalId) public onlyInvestor(){
        // we are pointing to the proposal with the help of proposalId and storing it in variable proposal with storage keyword.
        // this improve the code readability
        Proposal storage proposal = proposals[porposalId];

        // checking that if investor is already voted or not , if voted then throw the error
        // if not excute next line
        // in this isVoted is nested mapping , checking that msg.sender that who call's the function with the proposalId
        // if investor is already voted then throw the error, else excute the next line of code  
        require(isVoted[msg.sender][porposalId] == false, "You have already voted for this proposal");

        // it will check that the end time for voting a proposal is greater than the current voting time i.e block.timestamp
        // if not then throw the error, if voting is present then excute next line  
        require(proposal.end > block.timestamp, "Voting Time Ended");

        // then we check that it is already excuted or not, if it is excuted then throw the error,
        // otherwise excute the next line of code
        require(proposal.isExcuted == false, "It is already Excuted");

        // then uper ke sare conditions check hone ke badd he below line of code excute hoga
        // voting ko true kar do uss particular proposal ke liye
        isVoted[msg.sender][porposalId] = true;

        // voter ke pass jitne number of shares hai utne he unke votes and authority hogi.
        // to jitne shares the wahi ek tarah se unke authority or votes ho gaye for proposal ke vote ke liye
        proposal.votes += numOfshares[msg.sender]; //proposal.votes = proposal.votes + numOfshares[msg.sender]
    }

    // function for excuting the proposal
    // and iss function ko sirf aur sirf manager he call kara sakta hai
    function excuteProposal(uint proposalId) public onlyManager(){
        // we are pointing to the proposal with the help of proposalId and storing it in variable proposal with storage keyword.
        // this improve the code readability
        Proposal storage proposal = proposals[porposalId];

        // ab ham check karnege majority of votes proposal ko hai ya nahi,  with compare to quorum that is minimum number of votes to excute the proposal
        // agar hai to he next line excute hogi, otherwise throw the error
        // like understand this by example :-
        // votes = 50, totalShares = 100, percentage = (50/100)*100 = 50%
        // and quorum suppose is = 51% , so this will not excute , as majority is not with the proposal
        require(((proposal.votes * 100) / totalShares) >= quorum, "Majority does not support");

        // then make the isExcuted true
        proposal.isExcuted = true;

        // then dedcut the proposal.amount from availableFunds
        availableFunds -= proposal.amount;

        // after that call the function _transfer to transfer the amount and to whom want to transfer
        // this function we will create outer side of this function , to maintain the modularity of the contract
        _transfer(proposal.amount, proposal.receipint);
    }

    // this is function to transfer money/ethers, after the excution of certain proposal
    function _transfer(uint amount, address payable receipint) private{
        receipint.transfer(amount);
    }

    // function to return all the Proposal List which are present in DAO
    function ProposalList() public view returns(Proposal[] memory) {
        // below line will create a Proposal array , and it is empty array of length nextProposalId - 1
        Proposal[] memory arr = new Proposal[](nextProposalId - 1); //empty array of length = nextProposalId - 1 

        // created a for loop, to iterate over through the proposalId's mapping
        for(uint i = 0; i<nextProposalId; i++){
            // and then transfering the mapping values from proposals to the array
            // because we can't return the mapping values in the function, that's why we are transfering mapping values to array
            arr[i] = proposals[i]; 
        }
        // then return the arr
        // it will return all the proposal which are present in proposals mapping
        return arr;
    }    
}
