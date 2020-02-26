pragma solidity ^0.5.16;

contract MemoryArray {
  uint[] foo;

    /**
     * You have to use new keyword for creating variable length in-memory arrays. 
     * As opposed to storage arrays, it's not possible to resize memory arrays by assigning to the length member.
     */
     
  constructor () public {
    uint[] memory bar = new uint[](5);
    bytes memory qux = new bytes(5);

    // dynamically resize storage array
    foo.length = 6;
    foo[5] = 1;
    assert(foo[5] == 1);

    // doesn't work
    // bar.length = 6;
    // qux.length = 6;
  }
}
