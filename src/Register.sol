// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Register {
    string public github;
    address public owner;

    struct Referral {
        address futureReferral;
        string gitHub;
    }

    Referral[] public referrals;

    constructor() {
        github = "Ucheokolo";
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized Personel");
        _;
    }

    function addReferral(
        address _refAddr,
        string memory _refGithub
    ) public onlyOwner {
        Referral memory newReferral;
        newReferral.futureReferral = _refAddr;
        newReferral.gitHub = _refGithub;

        referrals.push(newReferral);
    }

    function totalReferrals() public view returns (uint) {
        return referrals.length;
    }
}
