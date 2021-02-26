// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract BallotV1 {
    
    // attributes of voter
    struct Voter {
        uint weight; // how much value a vote has? 1,2,?
        bool voted;  // whether voted or not
        uint vote;   // which proposal index has received vote
    }

    // attributes of proposal
    struct Proposal {
        uint voteCount;
    }
    
    // person who conducts election
    address chairperson;
    
    // voters list
    mapping(address => Voter) voters;
    
    // list of Proposals
    Proposal[] proposals;
    
    // election takes place in phases
    enum Phase {Init, Regs, Vote, Done}
    
    // intial phase would be Init
    Phase public state = Phase.Init;
}


