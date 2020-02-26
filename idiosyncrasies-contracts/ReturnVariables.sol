pragma solidity ^0.5.16;

/**
 * You can specify named output parameters in returns signature which creates new local variables.
 */

contract MyContract {
  constructor ()public {
    assert(myMethod() == 10);
  }

  function myMethod()public pure returns (uint num) {
    num = 10;
    return num;
  }
}
