pragma solidity ^0.5.16;

/**
 * Declaring a local array and assuming it'll be created in memory but it actually overwrites storage; 
 * e.g. the type of the local variable x is uint[] storage, 
 * but it has to be assigned from a state variable before it can be used because storage is not dynamically allocated, 
 * so it functions only as an alias for a pre-existing variable in storage. 
 * What happens is that the compiler interprets x as a storage pointer and will make it point to the storage slot 0 by default, 
 * which in this case is variable foo, and is modified by x.push(1) causing an error.
 */

contract StorageOverride {
  uint foo;
  uint[] bar;

  /*
  // This will not work!
  function StorageOverride () {
    uint[] x;
    x.push(1);
    bar = x;
  }
  */

  constructor ()public {
    uint[] memory x = new uint[](5);
    x[0] = 1;
    bar = x;

    assert(foo == 0);
    assert(bar[0] == 1);
  }
}
