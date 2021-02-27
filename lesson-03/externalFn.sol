// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract Infofeed {
    function info() public pure returns (uint) {
        return 42;
    }
}

interface ISample {
    function callFeed() external view returns(uint);
}

contract Sample is ISample {
    function callFeed() public virtual override view returns(uint) {
        return 2;
    }
    
    modifier onlyOwner() virtual {
        _;   
    }
}

contract Consumer is Sample{
    Infofeed feed;
    address owner;
    
    constructor(Infofeed _feed) payable {
        require(msg.value == 1 ether);
        feed = _feed;
        owner = msg.sender;
    }
    
    modifier onlyOwner() override {
        require(msg.sender == owner);
        _;
    }
    
    function callFeed() public view override returns(uint) {
        return feed.info();
    }
    
    function getFeed() public view returns(address) {
        return address(feed);
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance; // wei units
    }
}
