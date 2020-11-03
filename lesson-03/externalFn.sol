// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract InfoFeed {
    function info() public payable returns(uint) {
        return 42;
    } 
    
    function getBal() public view returns(uint) {
        return address(this).balance;
    }
}

interface ISample {
    function callFeed(address) external returns(uint);
}

contract Sample is ISample{
    function callFeed(address) public virtual override returns(uint){
        return 2;
    }
    
    modifier onlyOwner() virtual{
        _;
    }
}

contract Consumer is Sample{
    InfoFeed feed;
    address public owner;
    constructor(InfoFeed _addr) payable {
        feed = _addr;
        owner =msg.sender;
    }
    
    modifier onlyOwner() override {
        require(msg.sender == owner);
        _;
    }
    
    function callFeed(address) public override returns(uint){
        return feed.info{value:10,gas:200}();
    }
    
    function getBal() public view returns(uint) {
        return address(this).balance;
    }
}