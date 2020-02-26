pragma solidity ^0.5.16;

/**
 * Can't return struct for external methods; need to return multiple values.
 */

contract MyContract {
  struct MyStruct {
    string str;
    uint i;
  }

  MyStruct myStruct;

   constructor()public {
    myStruct = MyStruct("foo", 1);
  }

  function myMethod() external view returns (string memory, uint) {
    return (myStruct.str, myStruct.i);
  }
}
