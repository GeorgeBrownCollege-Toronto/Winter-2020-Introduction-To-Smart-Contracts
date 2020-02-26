pragma solidity ^0.5.16;

/**
 * Solidity inherits scoping rules from JavaScript; 
 * a variable declared anywhere within a function will be in scope for the entire function, 
 * regardless of where it's declared. There is no block scoping, e.g. the following examples:
 */

contract MyContract {
  function whileLoop()public pure {
    uint i = 0;

    while (i++ < 1) {
      uint foo = 0;
    }

    /*
    while (i++ < 2) {
      // Illegal, second declaration of variable.
      uint foo = 0;
    }
    */
  }

  function forLoop()public pure {
    for (uint i = 0; i < 1; i ++) {

    }

    /*
    // Illegal, second declaration of variable.
    for (uint i = 0; i < 1; i++) {

    }
    */
  }
}
