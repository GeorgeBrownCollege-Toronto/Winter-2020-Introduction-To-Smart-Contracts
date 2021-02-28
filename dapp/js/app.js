var url = "ws://127.0.0.1:7545";

var abi = [
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_n",
				"type": "uint256"
			}
		],
		"name": "decrement",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_n",
				"type": "uint256"
			}
		],
		"name": "increment",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "caller",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "Decrement",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "caller",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "Increment",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_x",
				"type": "uint256"
			}
		],
		"name": "set",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "caller",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "Set",
		"type": "event"
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
		"inputs": [],
		"name": "getOwner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

var caller;
var contractInstance;
var contractAddress = "0x454Fc4a559bd801E569d6586445d2880A1B07ad2";

$("#setForm").submit((e) => {
  e.preventDefault();
  log("Setting storedData...");
  contractInstance.methods
    .set($("#setNumber").val())
    .send({ from: caller })
    .on("receipt", () => {
      // Nothing to do here. If the transaction is successful, it will trigger
      // events that we're already monitoring.
    }).on('error', function(_err, receipt) { // If the transaction was rejected by the network with a receipt, the second parameter will be the receipt.
        error(_err)
    });;
});

function log(message) {
  $("#log").append($("<p>").text(message));
  $("#log").scrollTop($("#log").prop("scrollHeight"));
}

function error(message) {
    $('#log').append($('<p>').addClass('dark-red').text(message));
    $('#log').scrollTop($('#log').prop('scrollHeight'));
}

$("#decrementForm").submit((e) => {
    e.preventDefault();
    log("Decrementing storedData...");
    contractInstance.methods
      .decrement($("#decrementNumber").val())
      .send({ from: caller })
      .on("receipt", () => {
        // Nothing to do here. If the transaction is successful, it will trigger
        // events that we're already monitoring.
      }).on('error', function(_err, receipt) { // If the transaction was rejected by the network with a receipt, the second parameter will be the receipt.
          error(_err)
      });;
  });

  $("#incrementForm").submit((e) => {
    e.preventDefault();
    log("Incrementing storedData...");
    contractInstance.methods
      .increment($("#incrementNumber").val())
      .send({ from: caller })
      .on("receipt", () => {
        // Nothing to do here. If the transaction is successful, it will trigger
        // events that we're already monitoring.
      }).on('error', function(_err, receipt) { // If the transaction was rejected by the network with a receipt, the second parameter will be the receipt.
          error(_err)
      });;
  });

function updateUI(storedData, owner) {
  $("#storedData").text(storedData.toLocaleString());
  $("#owner").text(owner.toLocaleString());
}

function loadData(blockNumber) {
  log("Loading data from contracts...");

  var storedData, owner;

  // Callback that waits for all three pieces of data before proceeding
  function updateWhenDone() {
    if (storedData !== undefined || owner !== undefined) {
      log("Updating UI.");
      updateUI(storedData, owner);
    }
  }

  contractInstance.methods
    .get()
    .call(blockNumber, (err, _storedData) => {
      if (err) return error(err);
      storedData = _storedData;
      updateWhenDone();
    });

    contractInstance.methods
    .getOwner()
    .call(blockNumber, (err, _owner) => {
      if (err) return error(err);
      owner = _owner;
      updateWhenDone();
    });
}

async function initialize() {
  provider.eth.getBlockNumber(function (err, lastSeenBlock) {
    // Load data for the initial block
    loadData(lastSeenBlock);

    // Handler for events that necessitate a UI update
    function changeHandler(err, data) {
      if (err) return error(err);

      // Only if we haven't already fetched data for this block
      if (data.blockNumber > lastSeenBlock) {
        lastSeenBlock = data.blockNumber;
        loadData(lastSeenBlock);
      }
    }
    contractInstance.events.Set(changeHandler);
    contractInstance.events.Increment(changeHandler);
    contractInstance.events.Decrement(changeHandler);
  });
}

$(() => {
  provider = new Web3(new Web3.providers.WebsocketProvider(url));
  contractInstance = new provider.eth.Contract(abi, contractAddress);
  provider.eth.getAccounts().then((accounts) => {
    caller = accounts[0];
  });
  initialize();
});
