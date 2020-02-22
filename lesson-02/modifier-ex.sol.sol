pragma solidity ^0.5.9;

contract ModifierDemo{
    
    address seller;
    
    constructor() public {
        seller = msg.sender;
    }
    
    modifier onlyOwner(){
        require(seller == msg.sender,'Unauthorised access');
        _;
    }
    
    function isSeller() public view onlyOwner returns(bool){
        return true;
    }
}