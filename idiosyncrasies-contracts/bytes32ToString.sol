pragma solidity ^0.5.16;

// Source: https://ethereum.stackexchange.com/a/2834/5093

contract MyContract {
  bytes32 bts = "foo";
  string str;

  constructor ()public {
    str = bytes32ToString(bts);
  }
  
  /**
   * Can't typecast bytes to string; need to do manual conversion.
   */

  function bytes32ToString(bytes32 x) public pure returns (string memory) {
    bytes memory bytesString = new bytes(32);
    uint charCount = 0;
    for (uint j = 0; j < 32; j++) {
      byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
      if (char != 0) {
        bytesString[charCount] = char;
        charCount++;
      }
    }
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (uint j = 0; j < charCount; j++) {
      bytesStringTrimmed[j] = bytesString[j];
    }
    return string(bytesStringTrimmed);
  }

  function bytes32ArrayToString(bytes32[] memory data)public pure returns (string memory) {
    bytes memory bytesString = new bytes(data.length * 32);
    uint urlLength;
    for (uint i=0; i<data.length; i++) {
      for (uint j=0; j<32; j++) {
        byte char = byte(bytes32(uint(data[i]) * 2 ** (8 * j)));
        if (char != 0) {
          bytesString[urlLength] = char;
          urlLength += 1;
        }
      }
    }
    bytes memory bytesStringTrimmed = new bytes(urlLength);
    for (uint i=0; i<urlLength; i++) {
      bytesStringTrimmed[i] = bytesString[i];
    }
    return string(bytesStringTrimmed);
  }
}
