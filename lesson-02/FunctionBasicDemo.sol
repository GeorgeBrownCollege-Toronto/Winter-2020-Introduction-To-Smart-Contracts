// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract SimpleStorage {
    
    string private name;
    bytes32 constant name1 = keccak256("A");
    mapping(address => bytes32) public transcripts;
    
    function store(string memory _name) public { // memory/calldata
        if(bytes(_name).length > 0) { // string is non-empty
        name = _name;
        }
        else {
            revert();
        }
    }
    
    function storeDoc(address _studentID, bytes32 _transcriptHash) public {
        transcripts[_studentID] = _transcriptHash;
    }
    
    function retrieve() public view returns(string memory) {
        return name;
    }
}