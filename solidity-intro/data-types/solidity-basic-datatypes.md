## Basic Solidity Data Types
In this tutorial we'll learn basic Solidity data types!

We'll use state variables to store them in the contract's persistent data storage:

```js
contract Contract {
    bool public value = true;
    int public a = 10;
    string public msg = "Hello World";
}
```
☝️ Some of these variables should look familiar to you from JavaScript! There appears to be a boolean, a number and a string. 🧐

In Solidity we're going to have to look at each of these data types in closer detail. 🔬

Since Smart Contracts deal primarily with digital value, it's important to understand everything that is happening on a granular level. Any mistake could have dire consequences! It's also important to do things **efficiently** since all storage and computation on the blockchain will cost money.

With this in mind, let's dive into Basic Solidity Data Types!

## 1. Booleans

### Details

#### ABI Validations
On some Solidity stages we'll provide a Validations tab. This tab is intended to help you quickly debug issues with mispellings or unexpected data types.

The validations use the Solidity **ABI**, which stands for **Application Binary Interface**. This interface is an output from solidity compiler which provides information about the Smart Contract to an external observer.

For example, the contract on the task tab:

```
contract Contract {
	bool public myVariable = true;
}
```
☝️ This contract would have a pretty simple ABI. It would just tell us about the getter function generated for `myVariable`.

Here is the ABI generated for this contract in JSON:

```json
[
	{
		"inputs": [],
		"name": "myVariable",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
```
☝️ Essentially this tells us that there is a **function** called `myVariable` that expects **no inputs** and will return one output: a **bool**.

That's a pretty good description of the contract to an outside observer! ✅

For the **Goal** on the task tab you'll need to create two variables: `a` and `b`. We're expecting your ABI will look like this:

```json
[
	{
		"inputs": [],
		"name": "a",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "b",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
```

The ABI Validations tab will automatically compile your solidity contract and check to see if it matches what we expect. This can help you diagnose **compile-time** issues quickly before you run the tests.

### Task

#### State Variables
Let's get started by writing some **state variables**! **State Variables** are stored in the contract's persistent memory. Modifying a state variable in one transaction will change its value for anyone who tries to read the variable afterwards.

In Solidity, declaring a state variable is as simple as declaring the variable inside of the contract:

```
contract Contract {
	bool myVariable;
}
```
The `Contract` now has a boolean state variable called `myVariable`! Sweet. 😁

>💭 What is the value of `myVariable` at this point? Data Types in Solidity have default values, for booleans it is `false`. So, after deploying this contract, `myVariable` would be `false`.

Now we're going to do two things to our variable: **make it public** and **give it an initial value of true**:

```
contract Contract {
	bool public myVariable = true;
}
```

☝️ See how we added the keyword `public` here? This automatically creates a **getter** function for the variable.

Now we can access the value in `myVariable` by calling a function on the contract with that very name: `myVariable()`.

##### 🏁 Your Goal: Add two boolean variables
Create two public boolean state variables on the contract: `a` and `b`.

Store `true` in the variable `a` and `false` in the value `b`.

>🔍 You'll see the **checkmarks** appear on your ABI Validations tab when you have successfully made two public variables a and b. Learn more about ABI Validations in details.

## 2. Unsigned Integers