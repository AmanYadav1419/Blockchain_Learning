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

    // created a mapping to store the followers, that which address are following the address, and that is dyanmic array of address
    mapping(address => address[]) public followers;

    // created two more variables
    uint nextId;
    uint nextMessageId;

    // created a function for creating and storing tweets
    // pass the author address and the tweet content to the function
    function tweet(address _author, string memory _content) public {
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
    ) public {
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
}
