/*
	Demonstrate various global variables available to contracts.
    Use this link for reference : 
    https://solidity.readthedocs.io/en/v0.6.3/units-and-global-variables.html#units-and-globally-available-variables
*/
pragma solidity ^0.5.16;

contract basicInfoGetter {

    address creator;

    constructor () public 
    {
        creator = msg.sender; 								    
    }
	
	function getCurrentMinerAddress() public view returns (address) // get CURRENT block miner's address, 
	{							
        // return statement to get the address of miner
	}
	
	function getCurrentDifficulty() public view returns (uint)
	{
		// return statement to get the difficuly 
	}
	
	function getCurrentGaslimit() public view returns (uint)  // the most gas that can be spent on any given transaction right now
	{													  
		// return statement to get the gas limit
	}
	
	function getCurrentBlockNumber() public view returns (uint)
	{
		// return statement to get the block number
	}
    
    function getBlockTimestamp() public view returns (uint) // returns current block timestamp in SECONDS (not ms) from epoch
    {													
    	// return statement to get the current block timestamp
    }
    
    function getMsgData() public pure returns (bytes memory) 		// The data of a call to this function. Always returns "0xc8e7ca2e" for me.
    {	
        // return statement to get the data from the transaction
    }
    
    function getMsgSender() public view returns (address)  // Returns the address of whomever made this call
    {													// (i.e. not necessarily the creator of the contract)
    
        // return statement to get the address of the caller
    }
    
    function getMsgValue() public payable returns (uint)		// returns amt of wei sent with this call
    {
    	// return statement to get the amount in wei sent to this function
    }
    
    /***  A note about gas and gasprice:
     
     Every transaction must specify a quantity of "gas" that it is willing to consume (called gaslimit), 
     and the fee that it is willing to pay per unit gas (gasprice). At the start of execution, 
     gaslimit * gasprice ether are removed from the transaction sender's account. 
     Whatever is not used is immediately refunded.
     
     */
    
    function getMsgGas() public view returns (uint)        
    {													
    	// return statement to get the gas left
    }
    
	function getTxGasprice() public view returns (uint) 	// "gasprice" is the amount of gas the sender was *willing* to pay. 50000000 for me. (geth default)
    {											     	
    	// return statement to get the gas price
    }
    
    function getTxOrigin() public view returns (address) 	// returns sender of the transaction
    {											   		
        // return statement to get sender of transaction
    }
    
	function getContractAddress() public view returns (address) 
	{
		// return statement to get address of this contract
	}
    
    function getContractBalance() public view returns (uint) 
    {
    	// return statement to get balance of this contract
    }
}