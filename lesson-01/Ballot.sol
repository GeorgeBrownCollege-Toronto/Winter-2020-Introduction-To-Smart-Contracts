// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Ballot {
    
    struct Voter {
      uint weight;
      bool voted;
      uint vote;
    }
    
    struct Proposal{
        uint voteCount;
    }
    
    address public chairperson; // Ethereum address is 20 bytes long = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    mapping(address => Voter) public voters;
    // {
    //     "0xabcd.1234" => {weight,voted,vote},
    //     "0xab12..def2" => {weight, voted,vote}
    // }
    // syntax for mapping and it is used to represent JSON structure in solidity
    // mapping( keyType => valueType ) public variable_name ;
    Proposal[] public proposals; 
    
    enum Phase {Init, Regs, Vote, Done}
    // it can take only 0,1,2,3 values:
    
    Phase public state = Phase.Init;
    
    constructor (uint numProposals) {
        chairperson = msg.sender;
        for(uint prop = 0 ; prop < numProposals ; prop++){
            // Proposal memory p;
            // p.voteCount = 0;
            // OR
            // Proposal memory p = Proposal(0);
            // proposals.push(p);
            // OR
            proposals.push(Proposal(0));
        }
    }
    
    function changeState(Phase x) public {
        if ( msg.sender != chairperson ) {
            revert("!chairperson");
        }
        if(x < state) {
            revert();
        }
        state = x;
    }
}