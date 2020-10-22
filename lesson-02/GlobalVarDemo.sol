// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract GlobalVarDemo {
    function getCurrentMiner() public view returns(address) {
        return block.coinbase;
    }
    
    function getCurrentDifficulty() public view returns(uint) {
        return block.difficulty;
    }
    
    function getCurrentBlockNumber() public view returns(uint) {
        return block.number;
    }
    
    function getCurrentTimeStamp() public view returns(uint) {
        return block.timestamp;
    }
    
    function getMsgData() public pure returns(bytes memory) {
        return msg.data;
    }
    
    function getMsgValue() public payable returns(uint) {
        return msg.value;
    }
    
    function getMsgGas() public view returns(uint) {
        return gasleft();
    }
    
    function getTxOrigin() public view returns(address) {
        return tx.origin;
    }
    
    function getContractAddress() public view returns(address) {
        return address(this);
    }
    
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
}