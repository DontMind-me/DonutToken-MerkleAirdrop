# 🍩 Merkle Airdrop with Donut Token 🍩

Welcome to the **Merkle Airdrop** project! This repository contains a Solidity smart contract for conducting efficient, secure token airdrops using Merkle trees. Eligible users can claim **Donut Tokens (DONUT)**, an ERC20 token, through this airdrop contract.

## 📜 Table of Contents
- [About the Project](#about-the-project)
- [How It Works](#how-it-works)
- [Contracts](#contracts)
  - [MerkleAirdrop](#merkleairdrop)
  - [DonutToken](#donuttoken)
- [Getting Started](#getting-started)
- [Deployment](#deployment)
- [Testing](#testing)
- [Usage](#usage)
- [License](#license)

## 📝 About the Project

This project leverages a Merkle tree to verify eligibility for token claims, requiring minimal on-chain storage by only storing the Merkle root. Users provide a Merkle proof and EIP-712-compliant signature to claim tokens securely.

## 🌟 How It Works

1. **Merkle Tree Verification**: Eligible users present a Merkle proof, which the contract verifies against the stored Merkle root.
2. **EIP-712 Signature**: An additional signature requirement ensures only authorized claimants can redeem tokens.
3. **Claim Process**: If verified, tokens are transferred to the claimant, and their claim is marked as completed.

## 📜 Contracts

### MerkleAirdrop
The `MerkleAirdrop` contract manages the airdrop, verifying claims and preventing multiple claims from the same address.

**Features:**
- `claim`: Verifies proof and transfers tokens
- **Event Emission**: Emits a `Claim` event upon successful claim

### DonutToken
An ERC20 token contract with a mint function, which the airdrop distributes to eligible participants. The token is owned by the deployer.

## 🚀 Getting Started

To work with this project locally, ensure you have Foundry installed. You can set up Foundry with:

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Then install dependencies:

```bash
forge install 
```

## 📤 Deployment

Use Foundry to deploy the contracts. Customize your environment variables in the ```.env``` file.

1. Compile the contracts:
    ```bash 
    forge build
    ```
2. Deploy Using Script:
    ```bash
    forge script script/Deploy.s.sol:DeployMerkleAirdrop --fork-url <YOUR_RPC_URL> --broadcast
    ```

## 🧪 Testing

To run Tests:
```bash
forge test
```
## 📘 Usage

### Claiming Tokens

To claim tokens, eligible users call the ```claim``` function on ```MerkleAirdrop``` with their Merkle proof and EIP-712 signature.

#### Parameters 
- `account`: Address of the claimant.
- `amount`: Number of tokens the claimant is eligible to claim.
- `merkleProof`: Array of Merkle proof hashes to verify eligibility.
- `v, r, s`: Components of the EIP-712 signature for authorization.


### Example Interaction 

An example script demonstrates claiming tokens. To simulate the process, run:

```bash
forge script script/Interaction.s.sol:ClaimTokens --fork-url <YOUR_RPC_URL> --broadcast
```

## 📄 License

This project is licensed under the MIT License.

-------------------------------------------------------------------------

THANK YOUU FOR VISITING MY PROJECT!!!

