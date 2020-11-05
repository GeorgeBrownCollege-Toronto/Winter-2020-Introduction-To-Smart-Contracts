var url = "http://127.0.0.1:8545";

var abi = [
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "n",
                "type": "uint256"
            }
        ],
        "name": "decrement",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "get",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "n",
                "type": "uint256"
            }
        ],
        "name": "increment",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "x",
                "type": "uint256"
            }
        ],
        "name": "set",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    }
];

var caller;
var contractInstance;
var contractAddress = "0x8bD3317Ac7a8cF2441D4D2121CCed8Cc9D5b8881";

var setTerm = document.querySelector(".set-uint-n");
var setBtn = document.querySelector(".set");
var getBtn = document.querySelector(".get");
var getResult = document.querySelector(".get-result");
var incTerm = document.querySelector(".increment-uint-n");
var incBtn = document.querySelector(".increment");
var decTerm = document.querySelector(".decrement-uint-n");
var decBtn = document.querySelector(".decrement");

setBtn.addEventListener("click", setFn);
getBtn.addEventListener("click", getFn);
incBtn.addEventListener("click", incFn);
decBtn.addEventListener("click", decFn);

function setFn(e) {
    e.preventDefault();
    var setVal = setTerm.value;
    contractInstance.methods.set(setVal).send({ from: caller }).on('receipt', () => {
        console.log("Set uint...");
    })
}

function getFn(e) {
    e.preventDefault();
    while (getResult.firstChild) {
        getResult.removeChild(getResult.firstChild);
    }
    contractInstance.methods.get().call().then(val => {
        console.log("Get uint...");
        var res = document.createElement("p");
        res.textContent = val;
        getResult.appendChild(res);
    });
}

function decFn(e) {
    e.preventDefault();
    var decVal = decTerm.value;
    contractInstance.methods.decrement(decVal).send({from:caller}).on("receipt", ()=>{
        console.log("Decrement uint...");
    });
}

function incFn(e) {
    e.preventDefault();
    var incVal = incTerm.value;
    contractInstance.methods.increment(incVal).send({from:caller}).on("receipt", ()=>{
        console.log("Increment uint...");
    });
}

window.onload = () => {
    provider = new Web3(new Web3.providers.HttpProvider(url));
    contractInstance = new provider.eth.Contract(abi, contractAddress);
    provider.eth.getAccounts().then((accounts) => {
        caller = accounts[0];
    })
};