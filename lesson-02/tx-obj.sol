tx = {
    
    from : <from-address>,
    to: <destination-address>,
    data: "<bytecode>",<"abritrary data"> //hex,//optional,
    value:<amount-of-ethers-in-wei>// for e.g. 1ether = 1000000000000000000 wei
    gas: <gas-price>,// ethgasstation.info in gwei
    gasLimit : <gas -estimate> // 20,000 
    nonce : <transaction-serial-number> // nonce of "from-account" from blockchain 
}