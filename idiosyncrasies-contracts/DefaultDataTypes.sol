pragma solidity ^0.5.16;

contract MyContract {
    /**
     * All primitive data types are initialized with default values; there is no "null" data type (like in JavaScript).
     */
     
  int n; // 0
  string str; // ""
  address addr; // 0x0000000000000000000000000000000000000000
  bool b; // false

  constructor () public {
    assert(n == 0);
    assert(keccak256(abi.encodePacked(str)) == "");
    assert(addr == address(0));
    assert(b == false);
  }
}


