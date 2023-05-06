
# Supply Chain Management Smart Contracts (Solidity)

This project contains the list of Solidity Smart Contracts that implement a solution to most of the prevalent problems in the practice of Supply Chain Management in the industry. Some of which are as follows:
* **Security:** The Ethereum Blockchain Technology offers a better security as compared to it's counterpart - Web2.0. It provides no single point of failure - Blockchain operates on a well-distributed network of nodes, hence data at all times is circulated through not one but multiple nodes, which makes sure that even if one node is hacked or faulty in any way the integrity of the original data will not be compromised.
* **Immutability:** Creating immutable ledgers is one of the main values of Blockchain. Any database that is centralised is destined for hacks and frauds since it requires trust in some third party intermediary to keep the database secure. Blockchain like Ethereum keeps its ledgers in a never-ending state of forwarding momentum. Every node on the system has a copy of the digital ledger. To add a transaction every node needs to check its validity. If the majority thinks it’s valid, then it’s added to the ledger. This promotes transparency and makes it corruption-proof.
* **Faster Settlement:** Traditional supply chain management systems are unbelievably slow, probably because they require a lot of settlement time and usually take days to proceed. We can solve this problem by the means of Blockchain as it can settle money transfer at really fast speeds. This ultimately saves a lot of time and money from these institutions and provides convenience to the consumer also.
* **Irreversibility:** Hashing is a complex mechanism, and it’s impossible to alter or reverse. Which means that no one can use the public key to reverse-engineer the private key. Also, a single change in the input could lead to a completely different key output, so minute changes will also be detected. In order to corrupt the network the hacker would have to alter at least 51% of the databases present on the nodes in the network. There could be millions and millions of people, where everyone has the same copy of the ledger. Accessing and hacking millions of computers is next to impossible and costly.




## Features

- The project follows the SOLID principle of **Single Responsibility** for better **Unit Testing**. Each of the components of the project are divided into separate files namely: 
    - contracts/common/DataTypes.sol - Contains all **struct**s required for processing Data Models.
    - contracts/common/Events.sol - Contains all the events emitted by the project at the successful completion of a process.
    - supplier/Supplier.sol - Contains all business logic related to the Raw Material Supplier in the process of Supply Chain Management.
    - manufacturer/Manufacturer.sol - Contains all business logic related to the Product Manufacturer in the process of Supply Chain Management.
    - distributor/Distributor.sol - Contains all business logic related to the Distributer of manufactured products in the process of Supply Chain Management.
    - MainContract.sol - Abstracts all the above Solidity files and calls all of them as per the use case.
- Events: At the end of registration of a Supplier, Manufacturer, Distributor, or on listing a new raw material, product, or on receiving orders the project emits **Events** which can be listened to.



## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`SEPOLIA_RPC_URL` - An RPC Endpoint that can be obtained from Infura, Zeeve.io, etc for the testnet SEPOLIA.

`SEPOLIA_PRIVATE_KEY` - The private key to a SEPOLIA Externally Owned Account (EOA).


## Run Locally

Clone the project

```bash
  git clone https://github.com/SupplyChainManagementProject/SupplyChainManagement.git
```

Go to the project directory

```bash
  cd SupplyChainManagement/
```

Install dependencies

```bash
  npm install
```

Launch a local Blockchain Node

```bash
  npx hardhat node
```

Deploy the smart contract

```bash
  npx hardhat run scripts/deploy.js
```


## Contributing

Contributions are always welcome!

If you'd like to contribute to this project, please follow these steps:

- Fork the repository on GitHub.
- Create a new branch with a descriptive name.
- Make your changes and test thoroughly.
- Commit your changes with clear and concise messages.
- Push your branch to your forked repository.
- Submit a pull request detailing your changes.


## License

The project is licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

