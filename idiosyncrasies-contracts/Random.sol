pragma solidity ^0.5.16;

contract MyContract {
  uint nonce = 0;
  
  /**
   * Generating random numbers is hard; because Ethereum a deterministic system. 
   * You can generate a "random" number based on the block hash and block number, 
   * but keep in mind that miners have influence on these values.
   */

  function rand(uint min, uint max) public view returns (uint) {
    return uint(blockhash(block.number-1))%(min+max)-min;
  }
}
