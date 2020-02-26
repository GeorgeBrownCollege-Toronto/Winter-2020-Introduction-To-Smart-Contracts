pragma solidity ^0.5.16;

/**
 * string has no length property; need to manually check string length in characters.
 */

contract MyContract {
  string str = "foo";

  constructor ()public {
    assert(bytesSize(str) == 3);
    assert(size(str) == 3);
  }

  function bytesSize(string memory s)public pure returns (uint) {
    return bytes(s).length;
  }

  function size(string memory s)public pure returns (uint) {
    uint length = 0;
    uint i = 0;
    bytes memory strBytes = bytes(s);

    while (i < strBytes.length) {
      if (strBytes[i]>>7 == 0) {
        i+=1;
      } else if (uint160(uint8(strBytes[i]>>5)) == 0x6) {
        i+=2;
      } else if (uint160(uint8(strBytes[i]>>4)) == 0xE) {
        i+=3;
      } else if (strBytes[i]>>3 == 0x1E) {
        i+=4;
      } else {
        i+=1;
      }

      length++;
    }
  }
}
