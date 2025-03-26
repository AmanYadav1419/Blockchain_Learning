// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;



contract ByteDataType{
    // syntax with example

    // agr ham chate hai ki 1 byte ko store karana
    bytes1 public n1 = "a";

    // agr ham chate hai ki 2 bytes ko store karana
    bytes2 public n2 = "am";
    
    // agr ham chate hai ki 3 bytes ko store karana
    bytes3 public n3 = "man";

    // and the maximum value of bytes can store is bytes32

    // to basically ham is function me n1 ko return kara rahe hai
    // n1 ki value kitni hai bytes1 to wahi ham returns me bata rahe taki wahi value return ho
    function getter() public view returns(bytes1){
        return n1;
    }

    // lekin ham bytes ka use kar ke array me index jasa fin
    // lekin agar hame ek address se koi particular ko fetch karna ya hash karna hai, and then usko agar manipulate karna
    // hai to ham kar sakte hai by using bytes , because ye bhi array ki tarah he store karta hai


    // ye wale function me hamne returns me bytes1
    // esliye likha hai takki ham n3 me ke kuch specific chunk ko he extract kar sake, with a specific size. 
    function getterIndex(uint index) public view returns(bytes1){
        return n3[index];
    }

    // ye wale function me hamne returns me bytes1
    // esliye likha hai takki ham n3 me ke kuch specific chunk ko he extract kar sake, with a specific size 

}