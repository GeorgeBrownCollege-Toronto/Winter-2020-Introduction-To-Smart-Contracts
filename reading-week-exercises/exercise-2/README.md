# Remix to create smart contract

## Prerequisites
1. Chrome or Firefox browser.
2. An Internet connection
3. MetaMask Plugin connected to the Test-Net
4. Some Funds in your Account

## Step by Step Instruction

### Creating first smart contract

- Open Remix at [https://remix.ethereum.org](http://remix.ethereum.org).
> It opens dark mode theme as default.

![remix](./assets/images/image1.png)

- You can use any theme you like. Click the Setting icon at the bottom left, scroll down, and choose whatever theme you like. | chose Flatly theme.

![remix-theme](./assets/images/image2.png)

### Enable the right plugins

![remix-theme](./assets/images/image3.png)

### Create new file

![remix-new-file](./assets/images/image4.png)

### Name it `MyContract.sol`

![remix-contract-file](./assets/images/image5.png)

### Add some code

```js
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.10;

contract MyContract {

    string public myString = ‘hello world!';
}
```

### Make sure AutoCompile Is set to true

Set **Auto compile** to true, so you don’t have to compile your smart contracts before deployment all the
time. Setting this to true is very very handy for smaller projects.

![remix-auto-compile](./assets/images/image6.png)

### Select the right environment to deploy it on the Blockchain

![remix-environment](./assets/images/image7.png)

### Connect MetaMask to remix

![remix-mm](./assets/images/image8.png)

### Deploy the smart contract

![remix-deploy](./assets/images/image9.png)

### Confirmation the transaction

![mm-confirm-deploy](./assets/images/image10.png)

### Wait until transaction is confirmed

![mm-confirm-tx](./assets/images/image11.png)

### Imteract with new contract

![remix-interact](./assets/images/image12.png)

#### Congratulations! You created, deployed and interacted with a simple contract using remix

## Submission

 - Submit the etherscan link that deployed `MyContract.sol`.