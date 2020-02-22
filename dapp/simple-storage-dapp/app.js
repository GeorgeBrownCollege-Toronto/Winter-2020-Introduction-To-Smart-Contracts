var url = "http://127.0.0.1:8545";
var bytecode = {
  linkReferences: {},
  object:
    "608060405234801561001057600080fd5b5061015d806100206000396000f3fe608060405234801561001057600080fd5b506004361061004c5760003560e01c80633a9ebefd1461005157806360fe47b11461007f5780636d4ce63c146100ad5780637cf5dab0146100cb575b600080fd5b61007d6004803603602081101561006757600080fd5b81019080803590602001909291905050506100f9565b005b6100ab6004803603602081101561009557600080fd5b8101908080359060200190929190505050610107565b005b6100b5610111565b6040518082815260200191505060405180910390f35b6100f7600480360360208110156100e157600080fd5b810190808035906020019092919050505061011a565b005b806000540360008190555050565b8060008190555050565b60008054905090565b80600054016000819055505056fea265627a7a723158209128f9635bb4bb4bdc36edd76dfecaa87b8d2d19e7ad2b4b95d3fb7cfdec6f3f64736f6c634300050c0032",
  opcodes:
    "PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH2 0x10 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH2 0x15D DUP1 PUSH2 0x20 PUSH1 0x0 CODECOPY PUSH1 0x0 RETURN INVALID PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH2 0x10 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH1 0x4 CALLDATASIZE LT PUSH2 0x4C JUMPI PUSH1 0x0 CALLDATALOAD PUSH1 0xE0 SHR DUP1 PUSH4 0x3A9EBEFD EQ PUSH2 0x51 JUMPI DUP1 PUSH4 0x60FE47B1 EQ PUSH2 0x7F JUMPI DUP1 PUSH4 0x6D4CE63C EQ PUSH2 0xAD JUMPI DUP1 PUSH4 0x7CF5DAB0 EQ PUSH2 0xCB JUMPI JUMPDEST PUSH1 0x0 DUP1 REVERT JUMPDEST PUSH2 0x7D PUSH1 0x4 DUP1 CALLDATASIZE SUB PUSH1 0x20 DUP2 LT ISZERO PUSH2 0x67 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST DUP2 ADD SWAP1 DUP1 DUP1 CALLDATALOAD SWAP1 PUSH1 0x20 ADD SWAP1 SWAP3 SWAP2 SWAP1 POP POP POP PUSH2 0xF9 JUMP JUMPDEST STOP JUMPDEST PUSH2 0xAB PUSH1 0x4 DUP1 CALLDATASIZE SUB PUSH1 0x20 DUP2 LT ISZERO PUSH2 0x95 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST DUP2 ADD SWAP1 DUP1 DUP1 CALLDATALOAD SWAP1 PUSH1 0x20 ADD SWAP1 SWAP3 SWAP2 SWAP1 POP POP POP PUSH2 0x107 JUMP JUMPDEST STOP JUMPDEST PUSH2 0xB5 PUSH2 0x111 JUMP JUMPDEST PUSH1 0x40 MLOAD DUP1 DUP3 DUP2 MSTORE PUSH1 0x20 ADD SWAP2 POP POP PUSH1 0x40 MLOAD DUP1 SWAP2 SUB SWAP1 RETURN JUMPDEST PUSH2 0xF7 PUSH1 0x4 DUP1 CALLDATASIZE SUB PUSH1 0x20 DUP2 LT ISZERO PUSH2 0xE1 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST DUP2 ADD SWAP1 DUP1 DUP1 CALLDATALOAD SWAP1 PUSH1 0x20 ADD SWAP1 SWAP3 SWAP2 SWAP1 POP POP POP PUSH2 0x11A JUMP JUMPDEST STOP JUMPDEST DUP1 PUSH1 0x0 SLOAD SUB PUSH1 0x0 DUP2 SWAP1 SSTORE POP POP JUMP JUMPDEST DUP1 PUSH1 0x0 DUP2 SWAP1 SSTORE POP POP JUMP JUMPDEST PUSH1 0x0 DUP1 SLOAD SWAP1 POP SWAP1 JUMP JUMPDEST DUP1 PUSH1 0x0 SLOAD ADD PUSH1 0x0 DUP2 SWAP1 SSTORE POP POP JUMP INVALID LOG2 PUSH6 0x627A7A723158 KECCAK256 SWAP2 0x28 0xf9 PUSH4 0x5BB4BB4B 0xdc CALLDATASIZE 0xed 0xd7 PUSH14 0xFECAA87B8D2D19E7AD2B4B95D3FB PUSH29 0xFDEC6F3F64736F6C634300050C00320000000000000000000000000000 ",
  sourceMap: "84:409:0:-;;;;8:9:-1;5:2;;;30:1;27;20:12;5:2;84:409:0;;;;;;;"
};
var abi = [
  {
    constant: false,
    inputs: [
      {
        internalType: "uint256",
        name: "n",
        type: "uint256"
      }
    ],
    name: "decrement",
    outputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "function"
  },
  {
    constant: true,
    inputs: [],
    name: "get",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256"
      }
    ],
    payable: false,
    stateMutability: "view",
    type: "function"
  },
  {
    constant: false,
    inputs: [
      {
        internalType: "uint256",
        name: "n",
        type: "uint256"
      }
    ],
    name: "increment",
    outputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "function"
  },
  {
    constant: false,
    inputs: [
      {
        internalType: "uint256",
        name: "x",
        type: "uint256"
      }
    ],
    name: "set",
    outputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "function"
  }
];

var provider;
var wallet;
var contractWithSigner;
var contractAddress;

var submitBtn = document.querySelector(".submit");
var deployForm = document.querySelector("form");
var privateKeyTerm = document.querySelector(".private-key");

var setTerm = document.querySelector(".set-uint-n");
var setBtn = document.querySelector(".set");
var getBtn = document.querySelector(".get");
var getResult = document.querySelector(".get-result");
var incTerm = document.querySelector(".increment-uint-n");
var incBtn = document.querySelector(".increment");
var decTerm = document.querySelector(".decrement-uint-n");
var decBtn = document.querySelector(".decrement");

deployForm.addEventListener("submit", submitDeploy);
setBtn.addEventListener("click", setFn);
getBtn.addEventListener("click", getFn);
incBtn.addEventListener("click", incFn);
decBtn.addEventListener("click", decFn);

function createWallet(privateKey) {
  wallet = new ethers.Wallet(privateKey, provider);
}

function submitDeploy(e) {
  e.preventDefault();
  createWallet(privateKeyTerm.value);
  // Create an instance of a Contract Factory
  var factory = new ethers.ContractFactory(abi, bytecode.object, wallet);
  factory.deploy().then(async contract => {
    await contract.deployed();
    console.log("Deployed...");
    contractAddress = contract.address;
    var contract = new ethers.Contract(contractAddress, abi, provider);
    contractWithSigner = contract.connect(wallet);
  });
}

function setFn(e) {
  e.preventDefault();
  var setVal = setTerm.value;
  contractWithSigner.set(setVal).then(async tx => {
    await tx.wait();
    console.log("Set uint...");
  });
}

function getFn(e) {
  e.preventDefault();
  while (getResult.firstChild) {
    getResult.removeChild(getResult.firstChild);
  }
  contractWithSigner.get().then(val => {
    console.log("Get uint...");
    var res = document.createElement("p");
    res.textContent = val;
    getResult.appendChild(res);
  });
}

function decFn(e) {
  e.preventDefault();
  var decVal = decTerm.value;
  contractWithSigner.decrement(decVal).then(async tx => {
    await tx.wait();
    console.log("Decrement uint...");
  });
}

function incFn(e) {
  e.preventDefault();
  var incVal = incTerm.value;
  contractWithSigner.increment(incVal).then(async tx => {
    await tx.wait();
    console.log("Increment uint...");
  });
}

window.onload = () => {
  provider = new ethers.providers.JsonRpcProvider(url);
};
