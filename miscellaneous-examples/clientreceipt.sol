pragma solidity ^0.5.16;

contract owned {
    address owner;
    constructor() public{
        owner = msg.sender;
    }
    modifier onlyowner{
        require(owner == msg.sender);
        _;
    }
}

contract killswitch is owned {
  event NomineesChanged(address keyholder, address executive);
  event BoxOpened();
  event BoxClosed();
  
  function nominate(address _keyholder, address _executive)public onlyowner {
  keyholder = _keyholder;
  executive = _executive;
  emit NomineesChanged(keyholder, executive);
  }

  function open()public {
    if (msg.sender == owner || msg.sender == keyholder) {
      isOpen = true;
      emit BoxOpened();
    }
  }
  function close()public {
    if (msg.sender == owner || msg.sender == keyholder) {
      isOpen = false;
      emit BoxClosed();
    }
  }
  modifier restricted {
  if (msg.sender == owner || (isOpen && msg.sender == executive)) {
    _;
  }
  }

  bool isOpen;
  address keyholder;
  address executive;
}

contract ClientReceipt is owned, killswitch {
  event AnonymousDeposit(address indexed _from, uint _value);
  event Deposit(address indexed _from, bytes32 _id, uint _value);
  event Refill(address indexed _from, uint _value);
  event Withdraw(address indexed _from, address indexed _to, uint _value);
  event Drain(address indexed _from, address indexed _to, uint _value);

  function() external payable {
    emit AnonymousDeposit(msg.sender, msg.value);
  }
  function deposit(bytes32 _id) public payable {
    emit Deposit(msg.sender, _id, msg.value);
  }
  function refill()public payable {
    emit Refill(msg.sender, msg.value);
  }
  function withdraw(address payable _to, uint _value) public payable {
    _to.transfer(_value);
    emit Withdraw(msg.sender, _to, _value);
  }
  function drain(address payable _to, uint _value)public {
    _to.transfer(_value);
    emit Drain(msg.sender, _to, _value);
  }
}