// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Register.sol";

contract RegisterDeployer is Script {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    Register public register;

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        register = new Register();
        vm.broadcast();
    }
}
