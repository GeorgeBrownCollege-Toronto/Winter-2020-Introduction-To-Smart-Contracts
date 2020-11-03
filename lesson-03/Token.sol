// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

import "./ConvertLib.sol";
import "./math.sol";

contract Token {
    
    using SafeMath for uint;
    
    mapping(address => uint) public balances;
    address public owner;
    uint public startTime;
    
    constructor(uint _totalSupply) {
        owner = msg.sender;
        balances[owner] = _totalSupply;
        startTime = block.timestamp;
    }
    
    modifier onlyIfBalance(uint _amount) {
        require(balances[msg.sender] > _amount,"insufficient balance");
        _;
    }
    
    function transferToken(address _to, uint _amount) public onlyIfBalance(_amount) {
        if(msg.sender == owner && block.timestamp >= startTime + 10 seconds){
            balances[msg.sender] = balances[msg.sender].sub(_amount);
            balances[_to] = balances[_to].add(_amount);
        }
        else {
            revert("TIme not elapsed yet");
        }
    }
    
    function getBalance(address _holder) public view returns(uint) {
        return balances[_holder];
    } 
    
    // function getBalanceInEth(address _holder) public view returns(uint) {
    //     return ConvertLib.convert(getBalance(_holder),2);
    // } 
}