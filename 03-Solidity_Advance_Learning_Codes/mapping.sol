// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Mapping {
    // in mapping ham do cheeze pass karte hai ek hota hi "key" and ek hota hai "value"
    // aur key and value ka hame data type pass karna hota hai.
    // syntax of mapping :-
    mapping(uint => string) public map;
    // basically ham mapping key ka data uint type me rakh rahe hai and value ka data ham string type me rakh rahe hai.
    // and then public kar ke ek variable declare kar diya hai i.e in this case this is map.

    // let's suppose agar hame student ke namm store karne hai
    // to ham kese data ko insert kar sakte hai through mapping

    // create a function to insert the data to mapping
    // why calldata because we are not chaning the value of name, we are just inserting the values.
    function insertData(uint key, string calldata name) public {
        // insertion in mapping with syntax and example :-
        map[key] = name;
    }

    // function to return the data
    // map[key] me kya store ho raha hai to store ho raha hai string esliye returns me string and string ek memory data type hai
    // esliye string ke sath memory keyword bhi, and make it view kyuki ham state variable data ko read kar rahe hai.
    function returnData(uint key) public view returns (string memory) {
        // returning the data
        return map[key];
    }

    // it look like an array but it is not an array, Here is the differnce between array and mapping :-

    // array index yani key hamesha uint type ka he hota hai
    // but in case of mapping , mapping me ham key ko in simple words like index, other than uint bhi rakh sakte hai.
    // and ham value ka bhi data type change kar sakte hai in mapping , so key ka bhi data type change ho sakta hai and
    // value ka bhi data type change ho sakta hai in case of mapping
    // but in case of array ham index yani ki key ke data type ko change nahi kar sakte hai, jo ki sirf uint hota hai
    // mapping jo hai wo array se fast hoti hai , kyuki ye hashing ke concept pe based hai.
    // mapping me continous memory allocation nhi hota hai , jabki array me continous memory allocation hota hai.
    // there is no extra memory wasteage in mapping compare to array , unused data storage locations are present in array.
    // in mapping we can't return whole/entire mapping , but in array we can return whole/entire array.
    // ham mapping ko function ke andar use kar sakte hai but declare nahi kar sakte

    // this topics need to practise :-
        // mapping with struct
        // mapping with array
}
