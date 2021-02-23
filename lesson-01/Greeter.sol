// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Greeter {
    // state variables
    string public yourName; // contract storage

    constructor() {
        yourName = "World";
    }
    
    function set(string memory _name) public {
        yourName = _name;    
    }
    
    function hello() public view returns(string memory) {
        return yourName;
    }
}