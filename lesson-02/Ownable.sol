pragma solidity ^0.5.16;

contract Ownable{
    address owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        // require(msg.sender == owner);
        if(msg.sender != owner){
            revert("");
        }
        _;
    }
}