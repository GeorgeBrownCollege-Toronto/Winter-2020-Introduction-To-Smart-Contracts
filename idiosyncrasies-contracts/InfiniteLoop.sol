pragma solidity ^0.5.16;

/**
 * The type is only deduced from the first assignment when using var; 
 * so this can be dangerous in certain scenarios where it's initialized to a smaller data type then expected, 
 * causing undesired consequences, like the following:
 */

contract MyContract {
  function loop()public pure{
    /* `i` will have max a max value of 255 (initialized as uint8),
     * causing an infinite loop.
     */
    for (uint i = 0; i < 1000; i++) {

    }
  }
}
