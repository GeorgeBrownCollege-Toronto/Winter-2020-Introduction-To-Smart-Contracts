# Starting, Pausing and Stopping Smart Contracts

## Prerequisites
1. Chrome or Firefox browser.
2. An Internet connection
3. Open Remix with the following Smart Contract:

```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract StartStopUpdateExample {
    function sendMoney() public payable {   
    }

    function withdrawAllMoney(address payable _to) public {
        _to.transfer(address(this).balance);
    }
}
```

## Step by Step Instruction

### Deploy the Smart Contract in the JavaScript VM

- Open the **Deploy and Run Transactions** view in Remix with the smart contract

![](./assets/images/image3.png)

### Send some money to the Smart Contract

![](./assets/images/image4.png)

### Copy the address of the second account

![](./assets/images/image6.png)

### Withdraw the Money

![](./assets/images/image7.png)

- This isn’t very secure, is it? Let’s add some checks…

### Update the Smart Contract

```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract StartStopUpdateExample {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, &quot;You cannot withdraw!&quot;);
        _to.transfer(address(this).balance);
    }
}
```

### Try to send and withdraw money again

>Note: Don’t forget to re-deploy the smart contract.

1. Deploy the Smart Contract using the first account in your account list
2. Send 1 Ether to your smart contract
3. Select and Copy the second account from your account list
4. Try to use the withdraw method using the second account from your account list
5. Switch back to your first account
6. See if you can withdraw now.

This time you can see that you can send money from any account. But you can use the withdraw method only from the account which deployed the smart contract. Observe the Logs-Output:

![](./assets/images/image8.png)

### Pause a Smart Contract

- With these new powers we got, it is easy to add a **pause** functionality. Let’s take the following code:

```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract StartStopUpdateExample {
    address owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, &quot;You are not the owner&quot;);
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, &quot;You cannot withdraw”);
        require(!paused, &quot;Contract Paused currently&quot;);
        _to.transfer(address(this).balance);
    }
}
```

![](./assets/images/image10.png)


### Try to withdraw money

- It won’t work and show you an error message. The contract is paused.

![](./assets/images/image11.png)

### Add a destroy functionality to the Smart Contract

- Consider the following source code:

```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.7.1;

contract StartStopUpdateExample {
    address owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You cannot withdraw!");
        require(!paused, "Contract Paused currently");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}
```

### Stop the Smart Contract

- Now deploy the new smart contract. Then copy your account address. Paste it into the **destroySmartContract** Input field. Hit the button, and then try to interact with the smart contract. It won’t work.

![](./assets/images/image12.png)

#### Congratulations!