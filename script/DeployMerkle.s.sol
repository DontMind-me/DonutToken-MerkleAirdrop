//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {DonutToken} from "../src/DonutToken.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DeployMerkle is Script {

    bytes32 private s_root = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    uint256 private s_amountToTransfer = 4 * 25 * 1e18;

    function deployMerkleAirdrop() public returns(MerkleAirdrop, DonutToken) {
        vm.startBroadcast();
        DonutToken token = new DonutToken();
        MerkleAirdrop airdrop = new MerkleAirdrop(s_root, token);
        token.mint(token.owner(), s_amountToTransfer);
        token.transfer(address(airdrop), s_amountToTransfer);
        vm.stopBroadcast();
        
        return (airdrop, token);
    }

    function run() external returns(MerkleAirdrop, DonutToken) {
        return deployMerkleAirdrop();
    }
}