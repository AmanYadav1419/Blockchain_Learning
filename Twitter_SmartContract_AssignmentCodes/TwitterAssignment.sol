// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TweetContract {
    struct TweetingStruct {
        address author;
        string tweetContent;
        uint timeStamp;
    }

    mapping(address => TweetingStruct) public tweet;

    function Tweeting(string calldata _tweetContent) public {
        // to store the author address
        tweet[msg.sender].author = msg.sender;

        // to store the timestamp
        tweet[msg.sender].timeStamp = block.timestamp;

        // to store the tweet content
        tweet[msg.sender].tweetContent = _tweetContent;
    }

    // to retrive the user details like address and the timestamp
    function getUserDetails(
        address userAddress
    ) public view returns (address, uint256, string memory) {
        // and returning the user details after getting user address as a parameter.
        // and we can return multiple data in solidity by comma (,) to seperate out the data.
        return (tweet[userAddress].author, tweet[userAddress].timeStamp, tweet[userAddress].tweetContent);
    }
}
