pragma solidity ^0.5.16;

contract Witness {
	enum Phase {
		NA,
		Part
	}
	struct Part {
		Phase p;
		byte[64] pub;
		bytes32 evidence;
	}
	
	constructor () public {
		m_begin = now;
	}
	
	function participate(byte[64] memory _pub) public payable {
		if (msg.value != c_stake)
			revert();
		
		m_parts[msg.sender].pub = _pub;
	}
	
	function submit(bytes32 _evidence) public {
	}
	
	mapping ( address => Part ) m_parts;
	uint constant c_stake = 1 ether;
	uint m_begin;
}