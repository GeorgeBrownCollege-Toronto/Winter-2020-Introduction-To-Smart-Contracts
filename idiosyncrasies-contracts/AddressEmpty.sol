pragma solidity ^0.5.16;

contract MyContract {
    /*
        Can't compare address to 0 to check if it's empty; need to compare to address(0).
    */
  function isEmptyAddress(address addr)public pure returns (bool) {
    return (addr == address(0));
  }
}
