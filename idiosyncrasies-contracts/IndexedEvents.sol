pragma solidity ^0.5.16;

/**
 * Have to use indexed keyword for events parameters to allow events them to be searchable; 
 * it allows you to search for the events using the indexed parameters as filters.
 */

contract MyContract {
  event Transfer(address indexed sender, address indexed recipient, uint256 amount);
}
