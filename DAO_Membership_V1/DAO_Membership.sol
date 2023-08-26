// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOMembership {
    uint256 constant requiredApprovals = 30;
    mapping(address => bool) memberStatus;
    mapping(address => bool) hasApplied;
    mapping(address => uint256) approvalCounts;
    mapping(address => mapping(address => bool)) hasApproved;
    uint256 totalMemberCount;

    constructor() {
        memberStatus[msg.sender] = true;
        totalMemberCount = 1;
    }

    function applyForEntry() public onlyNonMemberModifier {
        require(!hasApplied[msg.sender]);
        hasApplied[msg.sender] = true;
    }

    function approveEntry(address _applicant) public onlyMemberModifier {
        require(hasApplied[_applicant]);
        require(
            !hasApproved[_applicant][msg.sender]);

        unchecked {
            approvalCounts[_applicant]++;
        }

        unchecked {
            uint256 requiredApprovalsCount = (totalMemberCount *
                requiredApprovals) /
                100 +
                1;
            if (approvalCounts[_applicant] >= requiredApprovalsCount) {
                memberStatus[_applicant] = true;
                hasApplied[_applicant] = false;
                ++totalMemberCount;
            }
        }

        hasApproved[_applicant][msg.sender] = true;
    }

    function isMember(address _user) public view onlyMemberModifier returns (bool) {
        return memberStatus[_user];
    }

    function totalMembers() public view onlyMemberModifier returns (uint256) {
        return totalMemberCount;
    }

    modifier onlyMemberModifier() {
        require(memberStatus[msg.sender]);
        _;
    }

    modifier onlyNonMemberModifier() {
        require(
            !memberStatus[msg.sender]);
        _;
    }
}

