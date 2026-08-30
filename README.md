# 🔗 Solidity & Blockchain Development Learning Repository

[![Solidity Version](https://img.shields.io/badge/Solidity-%3E%3D0.7.0%20%3C0.9.0-363636?style=for-the-badge&logo=solidity)](https://soliditylang.org/)
[![Ethereum](https://img.shields.io/badge/Ethereum-EVM-3C3C3D?style=for-the-badge&logo=ethereum)](https://ethereum.org/)
[![License](https://img.shields.io/badge/License-GPL--3.0-blue.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0.html)
[![Web3 Development](https://img.shields.io/badge/Web3-Smart%20Contracts-f16822?style=for-the-badge&logo=web3dotjs)](https://web3js.readthedocs.io/)
[![Remix IDE](https://img.shields.io/badge/Remix%20IDE-Compatible-007acc?style=for-the-badge&logo=visualstudiocode)](https://remix.ethereum.org/)

---

## 📌 Executive Summary

Welcome to the **Blockchain & Solidity Development Master Repository**! This project is an exhaustive, production-grade learning path and codebase repository spanning fundamental distributed system principles to advanced Ethereum Virtual Machine (EVM) smart contract engineering.

The repository captures hands-on smart contract implementations, comprehensive lecture notes, architecture diagrams, and real-world decentralized application (dApp) projects, including a **Decentralized Autonomous Organization (DAO)**, a **Twitter/X Social Protocol**, a **Decentralized E-Voting System**, an **EVM Personal Multi-Sig Wallet**, and **Solidity Design Patterns**.

---

## 🗂️ Complete Directory & Nested Folder Structure

```micro-tree
Blockchain_Learning/
│
├── 📁 01-Blockchain_Basics_Notes/
│   └── 📄 My_notes_from_1-5Lectures.txt              # Blockchain fundamentals, cryptography, EVM nodes & gas architecture
│
├── 📁 02-Solidity_Basics_Learning_Codes/
│   ├── 📄 Address.sol                                # Address data type, transfers & balances
│   ├── 📄 Bool.sol                                   # Boolean logic & default values
│   ├── 📄 Bytes.sol                                  # Fixed byte arrays (bytes1 to bytes32)
│   ├── 📄 BytesAssignment.sol                        # Hands-on byte manipulation & hexadecimal hashing exercises
│   ├── 📄 Conditional.sol                            # Control flow statements (if/else) inside functions
│   ├── 📄 constructor.sol                            # Smart contract initialization & owner assignment
│   ├── 📄 Function.sol                               # Function definitions, parameter passing & state interaction
│   ├── 📄 integer.sol                                # Signed/Unsigned integers, ranges & memory gas optimization
│   ├── 📄 Loop.sol                                   # Iterative structures (for, while, do-while) in Solidity
│   ├── 📄 Modifier.sol                               # Custom function modifiers & execution flow control
│   ├── 📄 require.sol                                # Input validation, custom errors & state reversal
│   ├── 📄 Solidty_basics_Live_Notes.txt              # Comprehensive notes on SolC compilation, ABI vs Bytecode, EVM stack
│   ├── 📄 variables.sol                              # State vs Local variables, storage locations & persistent state
│   └── 📄 Visibility.sol                             # Access specifiers: public, private, internal, external
│
├── 📁 03-Solidity_Advance_Learning_Codes/
│   ├── 📄 ArrayofStruct.sol                          # Complex composite arrays & struct iteration
│   ├── 📄 DyanmicSizeArray.sol                       # Dynamic arrays, push/pop operations & gas trade-offs
│   ├── 📄 FixedSizeArray.sol                         # Static arrays, indexing & gas efficiency
│   ├── 📄 FixedSizeArrayAssignment.sol               # Practical fixed-array challenges
│   ├── 📄 GlobalvariableAssignmentSolvedByArray.sol   # Resolving global state tracking using dynamic arrays
│   ├── 📄 GlobalvariableAssignmentSolvedByMapping.sol # High-efficiency state tracking using mappings
│   ├── 📄 GlobalVariables.sol                        # EVM environment variables: block.timestamp, msg.sender, msg.value
│   ├── 📄 mapping.sol                                # Hash tables in Solidity (key-value storage)
│   ├── 📄 MemoryVsCalldata.sol                       # Data locations: memory vs calldata for reference types
│   ├── 📄 MemoryVsStorageKeyword.sol                 # Pointer reference (storage) vs copy reference (memory)
│   ├── 📄 NestedMapping.sol                          # 2D Hash tables for permission systems & access matrices
│   ├── 📄 Payable.sol                                # Native Ether handling, deposit mechanisms & contract balance
│   ├── 📄 Solidity_Advance_Live_Notes.txt            # Notes on Reference Data Types, EVM storage layout, gas reporting
│   ├── 📄 string.sol                                 # String declaration, gas impact & byte typecasting
│   ├── 📄 stringCompare.sol                          # String comparison using keccak256 hashing
│   ├── 📄 stringConcanate.sol                        # Concatenating strings via abi.encodePacked()
│   ├── 📄 struct.sol                                 # Custom user-defined composite data types
│   └── 📄 StructAssignment.sol                       # Struct array manipulation assignment
│
├── 📁 04-Twitter_SmartContract_AssignmentCodes/
│   ├── 📄 assignment.md                              # Functional specification for Twitter/X Smart Contract
│   └── 📄 TwitterAssignment.sol                      # Production-grade TweeterContract (Tweets, DMs, Follows, Access Delegation)
│
├── 📁 05-DAO_SmartContract_AssignmentCodes-02/
│   ├── 📄 assignmet.md                              # Decentralized Autonomous Organization specification
│   ├── 📄 DAOAssignment.sol                          # DAO organization contract (Contributions, Shares, Proposals, Quorum, Voting)
│   └── 📄 Notes.md                                   # DAO governance architecture notes
│
├── 📁 06-Voting_SmartContract/
│   └── 📄 Voting.sol                                 # E-Voting System contract (Candidates, Voters, Time-bound election, Result tallying)
│
├── 📁 07-Solidity_OOP's_Concepts_Learning/
│   ├── 📄 Abstract.sol                               # Abstract contracts, virtual functions & implementation overrides
│   ├── 📄 ContractObjects.sol                        # Instantiating contracts within contracts (Factory/Object concepts)
│   ├── 📄 ContractObjectWithCalculatorExample.sol    # Inter-contract method invocation (Calculator system)
│   ├── 📄 Event.sol                                  # EVM logging, indexed parameters & off-chain indexing triggers
│   ├── 📄 Inheritance.sol                            # Single, multi-level & hierarchical contract inheritance
│   ├── 📄 Interface.sol                              # Contract interface definitions, ABI specification & strict rules
│   ├── 📄 Library.sol                                # Stateless reusable code libraries (`using Library for type`)
│   ├── 📄 Polymorphism.sol                            # Function overloading & dynamic dispatch
│   ├── 📄 Solidity_OOP's_Live_Notes.txt              # Detailed lecture notes on Object-Oriented Principles in Solidity
│   ├── 📄 Solidity_OOP's_Live_SmartContract_Assignment.png # Visual diagram for Wallet assignment design
│   └── 📄 WalletSmartContractAssignment.sol          # Multi-user Smart Wallet contract with deposit events & ether disbursement
│
└── 📁 08-Solidity_Design_Pattern/
    ├── 📄 Fallback_Function.sol                      # Fallback & receive function mechanisms & low-level call execution
    └── 📄 Solidity_Design_Pattern.txt                # Notes on EVM function selectors, low-level interactions & design patterns
```

---

## 📖 Deep Learning Modules Overview

The learning path in this repository is divided into **8 structured modules**. For an exhaustive, line-by-line technical breakdown, mathematical formulas, notes, and contract code architecture of each module, please visit the dedicated guide:

> 📖 **[View the Complete Modules Deep Dive Guide (MODULES_DEEP_DIVE.md)](./MODULES_DEEP_DIVE.md)**

### Quick Module Summary Table

| Module # | Module Title & Directory                                                   | Core Topics Covered                                                                                                                                   | Primary Contracts & Notes                                                              |
| :------: | :------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------- |
|  **01**  | **Blockchain Basics Notes**<br>`01-Blockchain_Basics_Notes`                | Web1 vs Web2 vs Web3, SHA-256 Hashing, Block Headers, UTXO vs EVM, Gas Price/Limit, Node Types (Full, Light, Archive), Accounts.                      | `My_notes_from_1-5Lectures.txt`                                                        |
|  **02**  | **Solidity Basics & Syntax**<br>`02-Solidity_Basics_Learning_Codes`        | SolC compilation, ABI vs Bytecode, State vs Local variables, Pure/View mutability, Visibility matrix, Integer ranges, `require()`, `modifier`.        | `Address.sol`, `integer.sol`, `require.sol`, `Modifier.sol`, etc.                      |
|  **03**  | **Solidity Advance Learning**<br>`03-Solidity_Advance_Learning_Codes`      | Storage vs Memory vs Calldata, Fixed vs Dynamic Arrays, Mappings, Structs, EVM Globals (`block.timestamp`, `msg.sender`), Payable Ether.              | `Payable.sol`, `NestedMapping.sol`, `MemoryVsCalldata.sol`, etc.                       |
|  **04**  | **Twitter/X Smart Contract**<br>`04-Twitter_SmartContract_AssignmentCodes` | Social protocol on-chain, Tweeting, P2P Messaging, Social Follow Graph, Operator Access Delegation, Paginated Memory Slicing.                         | `TwitterAssignment.sol` (`TweeterContract`)                                            |
|  **05**  | **DAO Smart Contract**<br>`05-DAO_SmartContract_AssignmentCodes-02`        | Decentralized Governance, Ether Contributions, Shares Redemption, Share Transfers, Proposal Lifecycles, Weighted Voting & Quorum execution.           | `DAOAssignment.sol` (`DAOorganization`)                                                |
|  **06**  | **Voting Smart Contract**<br>`06-Voting_SmartContract`                     | Electronic E-Voting, Candidate/Voter registration, Time-bound voting period, Automated result declaration (`winner`), Emergency stop guard.           | `Voting.sol` (`Vote`)                                                                  |
|  **07**  | **Solidity OOP Concepts**<br>`07-Solidity_OOP's_Concepts_Learning`         | Object Instantiation (`new`), Single & Multi Inheritance, Abstract Contracts, Interfaces, Polymorphism, Reusable Libraries, Event Logs, Smart Wallet. | `Inheritance.sol`, `Interface.sol`, `Library.sol`, `WalletSmartContractAssignment.sol` |
|  **08**  | **Solidity Design Patterns**<br>`08-Solidity_Design_Pattern`               | Fallback & Receive handlers, Low-level function selector hashes (`0x...`), Re-entrancy guards, Pull-over-Push payments, Self-Destruct.                | `Fallback_Function.sol`                                                                |

---

## ⚡ Quick Contract Reference Matrix

| Contract Name                | Source File Path                                                        | Module | Primary Functionality                                      | Solidity Version |
| :--------------------------- | :---------------------------------------------------------------------- | :----: | :--------------------------------------------------------- | :--------------: |
| `TweeterContract`            | `04-Twitter_SmartContract_AssignmentCodes/TwitterAssignment.sol`        |   04   | Social network, Tweets, DMs, Operator delegation           | `>=0.7.0 <0.9.0` |
| `DAOorganization`            | `05-DAO_SmartContract_AssignmentCodes-02/DAOAssignment.sol`             |   05   | Autonomous governance, Share contributions, Voting, Quorum | `>=0.7.0 <0.9.0` |
| `Vote`                       | `06-Voting_SmartContract/Voting.sol`                                    |   06   | E-Voting platform, Time window, Result tallying            |    `^0.8.13`     |
| `WalletSmartContract`        | `07-Solidity_OOP's_Concepts_Learning/WalletSmartContractAssignment.sol` |   07   | Multi-user deposit tracking, Ether disbursement & Events   | `>=0.7.0 <0.9.0` |
| `Fallback_Function_Contract` | `08-Solidity_Design_Pattern/Fallback_Function.sol`                      |   08   | Low-level fallback triggers, function hash selectors       | `>=0.7.0 <0.9.0` |

---

## 🛠️ Tech Stack & Development Environment

- **Language**: Solidity (`^0.8.13`, `>=0.7.0 <0.9.0`)
- **Execution Environment**: Ethereum Virtual Machine (EVM)
- **Primary IDE**: [Remix Ethereum IDE](https://remix.ethereum.org/)
- **Supported Local Frameworks**: Hardhat, Foundry, Ganache, Anvil
- **Browser Wallet Integration**: MetaMask, Coinbase Wallet

---

## 📥 How to Clone & Use the Repository

Follow these step-by-step instructions to get a local copy of this repository up and running on your machine:

### 1. Clone the Repository

Open your terminal/command prompt and run:

```bash
git clone https://github.com/AmanYadav1419/Blockchain_Learning.git
```

### 2. Navigate to the Directory

```bash
cd Blockchain_Learning
```

### 3. Open in Your Preferred Code Editor

If you are using Visual Studio Code, run:

```bash
code .
```

---

## 📖 How to Compile, Deploy & Test

### Option 1: Using Remix IDE (Recommended for Beginners)

1. Open [Remix IDE](https://remix.ethereum.org/) in your web browser.
2. **Import Repository**:
   - In Remix, under the **File Explorer** tab, click on **Clone a Git Repository**.
   - Enter `https://github.com/AmanYadav1419/Blockchain_Learning.git` and hit enter.
3. **Compile Smart Contracts**:
   - Select any contract file (e.g., `04-Twitter_SmartContract_AssignmentCodes/TwitterAssignment.sol`).
   - Navigate to the **Solidity Compiler** tab on the left sidebar.
   - Match the compiler version with the contract `pragma` directive (e.g., `0.8.13` or `0.7.6`).
   - Click **Compile <ContractName>.sol**.
4. **Deploy Smart Contracts**:
   - Navigate to the **Deploy & Run Transactions** tab.
   - **Environment**: Choose `Remix VM (Cancun/Shanghai)` for quick local sandbox testing, or `Injected Provider - MetaMask` for testnets (Sepolia/Holesky).
   - Input constructor parameters (if applicable) and click **Deploy**.
5. **Interact**: Test state variables, write transactions, and inspect returned getter logs in Remix's interactive panel.

### Option 2: Using Hardhat / Foundry (CLI Execution)

If you prefer local development tools like Hardhat or Foundry:

```bash
# Initialize npm dependencies (if using Hardhat)
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox

# Compile contracts using Hardhat
npx hardhat compile

# Run tests
npx hardhat test

# If using Foundry
forge build
forge test
```

---

## 💡 Gas Optimization Best Practices Learned

Throughout this codebase, several critical EVM gas optimization principles are implemented:

1. **Calldata over Memory**: Using `calldata` for read-only function parameters reduces allocation costs.
2. **Bytes32 over String**: Using `bytes32` instead of dynamic `string` saves state storage slots.
3. **Mappings over Arrays**: Mappings provide $O(1)$ lookup efficiency without array iteration overhead.
4. **Events for Historical Data**: Emitting `event` logs instead of storing non-critical history in state variables reduces gas costs by orders of magnitude.
5. **Short-Circuit Validation**: Placing `require()` statements at the top of functions prevents unnecessary computation prior to reversion.

---

## 🤝 Contributing Guidelines & Raising a PR

Contributions, issues, and feature requests are welcome! Whether you want to fix a bug, optimize gas usage, or add new smart contract assignments, feel free to contribute.

### Step-by-Step Contribution Workflow

1. **Fork the Project**:
   Click the **Fork** button at the top right of the [GitHub Repository](https://github.com/AmanYadav1419/Blockchain_Learning) to create a copy in your account.

2. **Clone your Forked Repository**:

   ```bash
   git clone https://github.com/YOUR_USERNAME/Blockchain_Learning.git
   cd Blockchain_Learning
   ```

3. **Create a New Branch**:

   ```bash
   git checkout -b feature/YourFeatureName
   # or for bug fixes
   git checkout -b fix/BugFixDescription
   ```

4. **Make Your Changes & Test**:
   - Ensure your Solidity code specifies proper `SPDX-License-Identifier` headers.
   - Include meaningful comments explaining contract logic and parameters.
   - Verify smart contracts compile cleanly in Remix IDE or Hardhat without warnings.

5. **Commit Your Changes**:
   Use descriptive commit messages following semantic guidelines:

   ```bash
   git add .
   git commit -m "feat: add ERC-20 token implementation assignment"
   ```

6. **Push to Your Branch**:

   ```bash
   git push origin feature/YourFeatureName
   ```

7. **Open a Pull Request (PR)**:
   - Go to the original [AmanYadav1419/Blockchain_Learning](https://github.AmanYadav1419/Blockchain_Learning) repository.
   - Click on **Pull Requests** $\rightarrow$ **New Pull Request**.
   - Select `main` as the base branch and your `feature/YourFeatureName` branch as the compare branch.
   - Provide a concise title and detailed description of your additions/modifications.
   - Submit the PR for review!

---

## 👨‍💻 Author & Connect With Me

**Aman Yadav**  
FullStack Developer & Blockchain Developer

- 🌐 **Portfolio**: [aman-yadav1419-portfolio.vercel.app](https://aman-yadav1419-portfolio.vercel.app/)
- 💼 **LinkedIn**: [linkedin.com/in/aman-yadav2003](https://www.linkedin.com/in/aman-yadav2003/)
- 🐦 **Twitter / X**: [@Aman_Yadav1419](https://x.com/Aman_Yadav1419?t=DezgZO1fWZWSy1d-uMspHQ&s=09)
- 🐙 **GitHub**: [@AmanYadav1419](https://github.com/AmanYadav1419)

---

## 📜 License

This repository is open-source software licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) - see individual source files for `// SPDX-License-Identifier: GPL-3.0`.
