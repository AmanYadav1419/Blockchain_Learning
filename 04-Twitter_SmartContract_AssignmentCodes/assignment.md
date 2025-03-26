You are tasked with designing a Solidity smart contract called "TweetContract" that simulates a basic
social media platform's functionalities. The contract should allow users to post tweets, send
messages, follow other users, and manage access permissions. Implement the following:

    1. Tweeting:
    Create a function to allow users to post a tweet. This function should store the tweet's
    content, the author's address, and the timestamp of creation.
    
    2. Messaging:
    Implement a function that enables users to send messages to other users. It should record
    the sender, recipient, message content, and creation timestamp.
    
    3. Following Users:
    Develop a function that enables a user to follow another user by adding their address to a
    list of followed users.
    
    4. Access Control:
    Implement mechanisms to control access:
    Allow users to authorize other users to post tweets or send messages on their behalf.
    Allow users to revoke these authorizations.

    5. Retrieving Data:
    Create functions to retrieve:
    The latest tweets posted by users, considering a specified count.
    The latest tweets of a specific user, considering a specified count.