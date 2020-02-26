pragma solidity ^0.5.16;

/**
 * Can't compare two strings; one easy workaround is to compare the keccak256 hashes of the strings.
 */

contract MyContract {
  function compare(string memory s1, string memory s2)public pure returns (bool) {
    return (keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2)));
  }
}
