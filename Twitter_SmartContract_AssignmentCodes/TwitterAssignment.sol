// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TweeterContract {
    // this struct is for tweet
    struct Tweet {
        uint id;
        address author;
        string content;
        uint createdAt;
    }

    // one more struct for message
    struct Message {
        uint id;
        address from;
        string Msgcontent;
        address to;
        uint MsgCreatedAt;
    }

    // at the first stage we are storing all mappings and variable to public , for easy acess
    // later on we will update/modify them as need

    // created a mapping fo storing Tweet, value part is Tweet Struct
    mapping(uint => Tweet) public tweets;

    // created mapping to store the tweets id , and that is dynamic array
    mapping(address => uint[]) public tweetsOf;

    // created mapping to store the messages , and that is dyanmic array, value part is Message Struct
    // to basically ek address jitne chaiye utne message send kar sakta hai esliye Message[] dyanmic array hai.
    mapping(address => Message[]) public conversations;

    // created a nested mapping for the transfering of ownership of accounts for that it is
    mapping(address => mapping(address => bool)) public operators;

    // created a mapping to store the following, that which address are following the addressess, and that is dyanmic array of address
    mapping(address => address[]) public following;

    // created two more variables
    uint nextId;
    uint nextMessageId;

    // created a function for creating and storing tweets
    // pass the author address and the tweet content to the function
    function _tweet(address _author, string memory _content) internal {
        // so we are accessing and storing tweets with nextid
        // then we are pushing or passing the all data in Tweet Structs, the nextId is like tweet id, the _author , _content
        // and for timestamp we are using block.timestamp for getting and storing the current time , this stores in unix timestamp
        tweets[nextId] = Tweet(nextId, _author, _content, block.timestamp);
        // after that storing tweet increment the nextId by 1, so that no conflicts will occur
        // so that new tweet will get store on new nextId
        nextId = nextId + 1;
    }

    // created a function for creating and storing messages i.e conversations
    function _sendMessage(
        address _from,
        address _to,
        string memory _content
    ) internal {
        // to basically ham conversations me from ke address ko he point kar ke work kar rahe hai,
        // and kyuki ye dynamic array hai to yaha pe push() method ka use hoga
        // and ess push me ham Message array me push karenge, push karte wakt jase struct define hai wase he push karna hoga
        // and for timestamp we are using block.timestamp for getting and storing the current time , this stores in unix timestamp
        conversations[_from].push(
            Message(nextMessageId, _from, _content, _to, block.timestamp)
        );
        // after the message send and store hone ke badd nextMessageId ko increment by 1 karna hoga so that no conflicts will occur
        // so that new message will get store on new nextMessageId
        nextMessageId++;
    }

    // function to call the upper functionalities that are internal, which means we only use them only within smart contract

    // function to call the _tweet function, in different ways
    // first is by using msg.sender in place of address _from

    // call by owner
    function tweet(string memory _content) public {
        _tweet(msg.sender, _content);
    }

    //call by owner ne jisse account ka acess diya hoga
    function tweet(address _from, string memory _content) public {
        _tweet(_from, _content);
    }

    // function to call the _sendMessage function, in different ways
    // first is by using msg.sender in place of address _from

    // call by owner
    function sendMessage(address _to, string memory _content) public {
        _sendMessage(msg.sender, _to, _content);
    }

    //call by owner ne jisse account ka acess diya hoga
    function sendMessage(
        address _from,
        address _to,
        string memory _content
    ) public {
        _sendMessage(_from, _to, _content);
    }

    // function to follow the address

    // call by the owner
    function follow(address _followed) public {
        // in following mapping , identify by the owner i.e msg.sender then push the _followed address to the array of address i.e following
        following[msg.sender].push(_followed);
    }

    // //call by owner ne jisse account ka acess diya hoga
    // function follow(address _from ,address _followed) public {
    //     // in following mapping , identify by the owner i.e _from then push the _followed address to the array of address i.e following
    //     following[_from].push(_followed);
    // }

    // function to allow the acess from owner to the operator
    function acess(address _operator) public {
        // operators ke mapping me owner yani msg.sender ka address , kis ko allow kiya hai uska address yani _operator and allow hai to true
        operators[msg.sender][_operator] = true;
    }

    // function to disallow the acess from owner to the operator
    function disallow(address _operator) public {
        // operators ke mapping me owner yani msg.sender ka address , kis ko disallow kiya hai uska address yani _operator and disallow hai to false
        operators[msg.sender][_operator] = false;
    }

    // function to get latest tweets
    // it accepts the count, how many tweets we want in latest
    function getLatestTweets(uint count) public returns (Tweet[] memory) {
        // condition checking, if false throw the Count is Not Proper.
        require(count > 0 && count <= nextId, "Count is Not Proper");
        // and condition true hone par below code excute hoga
        Tweet[] memory _tweets = new Tweet[](count);
        // Tweet array create ho raha hai , jo ki filhal empty hai then,
        // array ki length ye jitna count hai utni hai

        // variable for to use in looping all the latest tweets
        uint j;

        for (uint i = nextId - count; i < nextId; nextId++) {
            // suppose count is 5 and the nextId value is 7
            // so 7 - 5 = 2, so it will start from 2,3,4,5,6 upto 6
            Tweet storage _structure = tweets[i];

            // then store the structure or push them to Tweet struct
            _tweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );

            // then increament the value of j
            j = j + 1;
        }
        // then return the _tweets
        return _tweets;

        // yaha par jugad ye hua hai ki kyuki ham mapping ko function ke andar return nahi kara sakte hai i.e tweets
        // ye mapping hai to hame usse mapping ke data ko jabran array me push karana pada
        // to ese jugad se ham array me data pass kar ke mapping ke data ko return kara rahe hai.
    }
}
// important points from interview point :-
// solbam token ye asa token ke hai jo ek barr wallet pe store ho gaya to wo hamesha ke liye rahega.
// for voting boba token's ka use hota hai
// company name is Dapex
