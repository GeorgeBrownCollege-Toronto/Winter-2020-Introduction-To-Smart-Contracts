pragma solidity ^0.5.16;

/**
 * The type of an array literal is a memory array of fixed size whose base type is the common type of the given elements; 
 * e.g. the type of [1, 2, 3] is uint8[3] memory, because the type of each of these constants is uint8. 
 * Fixed size memory arrays can't be assigned to dynamically-sized memory arrays, e.g. 
 * the following is not possible:
 */

contract MyContract {
   constructor()public {
    /* This creates a `TypeError` because uint8[3] memory
     * can't be converted to uint256[] memory.
     */
    // uint[3] memory x = [1, 2, 3];

    // This works, because it's the same common type.
    uint8[3] memory y = [1, 2, 3];

    // This works, because it's the same common type.
    uint16[3] memory z = [256, 2, 3];
  }
}

