// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract GeneralMapping {
    mapping(uint => address) Names;
    
    uint counter;
    
    function addToMapping(address _addressDetails) public returns(uint) {
        counter++;
        Names[counter] = _addressDetails;
        return counter;
    }
    
    function getMappingMember(uint id) public view returns(address) {
        return Names[id];
    }
}

contract Token {
    mapping(address => uint) balances;
    address public owner;
    uint public totalSupply;
    uint public immutable startTime;
    
    constructor(uint _totalSupply) {
        owner = msg.sender;
        totalSupply = _totalSupply;
        balances[owner] = _totalSupply;
        startTime = block.timestamp;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner,"unauthorised");
        _;
    }
    
    function mint(address _to, uint _amount) public onlyOwner {
        balances[_to] += _amount;
        totalSupply += _amount;
    }
    
    function transferToken(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "insufficient balance");
        require(block.timestamp >= startTime + 10 seconds, "too early");
        require(msg.sender != _to, "recipient and sender cannot be same");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
    
    function getBalances(address _holder) public view returns(uint) {
        return balances[_holder];
    }
}
