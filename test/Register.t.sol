// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
// import "../src/Counter.sol";
import "../src/Register.sol";

contract CounterTest is Test {
    Register public register;

    address owner = mkaddr("owner");
    address imposter = mkaddr("imposter");

    function setUp() public {
        vm.startPrank(owner);
        register = new Register();
        vm.stopPrank();
    }

    function testAddRefferal() public {
        vm.startPrank(imposter);
        register.addReferral(
            0x4a527B2d6e411F8777a3a7391dC5D0F98F8703d4,
            "UcheOkolo"
        );

        register.addReferral(
            0x194e43c87560861168f18C811B0E9EB64Ba18233,
            "NonsoOkolo"
        );
        vm.stopPrank();
    }

    function testTotalrefferals() public {
        testAddRefferal();
        register.totalReferrals();
    }

    function mkaddr(string memory name) public returns (address) {
        address addr = address(
            uint160(uint256(keccak256(abi.encodePacked(name))))
        );
        vm.label(addr, name);
        return addr;
    }
}
