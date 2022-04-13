# harmony-zkDAO-submissions
Answers to the pre-requisite tasks for entering the summer 2022 Harmony zkDAO summit. 

### What is a smart contract? How are they deployed? You should be able to describe how a smart contract is deployed and the necessary steps.

- A smart contract is a set of instructions to be performed by a network of computers all around the world where the results of each computer get checked against each other to see whether they have reached the same conclusion.

- A smart contract needs to be compiled (converted) to a form that the network of computers (Ethereum) running a blockchain on top of it can understand, in our case this format is called EVM bytecode. Once you have the compiled bytecode you can create a contract address, call the constructor of the smart contract and initialize the contract on an address on the Ethereum blockchain. In order to deploy a contract, the deployer will need to pay a fee (gas). You also require access to an Ethereum node to relay (transmit) the transaction to the Ethereum network. 

### What is gas? Why is gas optimization such a big focus when building smart contracts?

- Gas is a concept that represents the cost of computation on a decentralized blockchain like Ethereum. Each operation executed by the network has an associated cost denominated in wei (a very small fraction of the ether cryptocurrency, 10^-18 to be exact, gas will usually be represented in gwei - 10^-9).  If you create a smart contract and compile it to EVM bytecode, the so-called opcodes (fundamental operations supported by the EVM) that have a gas price attached to them get summed up and you get a final price denominated in wei. Since ether and fractions of it like wei and gwei have a market price on exchanges against currencies like the USD, we can attach a tangible price to running operations on Ethereum, this is know as the gas price of a transaction. The more complex the transaction, the more expensive it will be.

- Optimizing smart contracts for low gas consumption has historically been important because of how expensive it is for users to interact with them. The less gas-intensive a contract is, the cheaper it is to deploy and interact with. In the future it will be less of a focus as blockchains start scaling with solutions like layer 2s (rollups, validiums, volitions, ...). 

### What is a hash? Why do people use hashing to hide information?

- A hash is a cryptographic primitive that converts a variable length string (word) into a fixed length string in a way that you can't deduce what was the initial string just by looking at the hash of the string.

- For example when signing a message with a private key, the signature algorithm (set of steps to achieve a goal) uses hashing and some other math to create a valid signature. The signature does not reveal the private key, but we can verify that the signature belongs to a certain public key (which is derived from a private key).

### How would you prove to a colorblind person that two different colored objects are actually of different colors?

- If the colorblind person where to hide the items from me, associate numbers to each object internally, and shuffle them around. He'd be able to then check with with me whether I am able to tell the difference between which object has color 'A' and which one has color 'B'. He's able to sample my guess ever more and get an ever bigger assurance that I am able to tell they are of different colors since he remembers which number he associated with each.
