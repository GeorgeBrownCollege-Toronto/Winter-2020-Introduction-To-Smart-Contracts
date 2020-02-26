pragma solidity ^0.5.16;

contract MyContract {
  string public str;

   constructor()public {
    str = toString(msg.sender);
  }

    /**
     * Can't typecast address to string; need to manually convert using bytes
     */
  function toString(address addr)public pure returns (string memory) {
    bytes memory b = new bytes(20);
    for (uint i = 0; i < 20; i++)
    b[i] = byte(uint8(uint(addr) / (2**(8*(19 - i)))));
    return string(b);
  }
}
