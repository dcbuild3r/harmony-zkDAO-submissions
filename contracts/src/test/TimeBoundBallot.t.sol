// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "../TimeBoundBallot.sol";
import "ds-test/test.sol";

interface Vm {
    function prank(address) external;
    function warp(uint256) external;
    function addr(uint256 privateKey) external returns (address);
    function expectRevert(bytes4) external;
    function label(address addr, string calldata label) external;
}


contract ContractTest is DSTest {
    
    TimeBoundBallot ballot;
    Vm constant vm = Vm(HEVM_ADDRESS);
    address alice = vm.addr(420);
    address bob = vm.addr(69);

    bytes32[] _proposalNames = [bytes32(0x6261720000000000000000000000000000000000000000000000000000000000),bytes32(0x6261720000000000000000000000000000000000000000000000000000000000)];


    function setUp() public {
        vm.label(alice, "Alice");
        vm.label(bob, "Bob");
        vm.label(address(this), "TestContract");
        // set up with random bytes32 proposal names
        ballot = new TimeBoundBallot(_proposalNames);
    }

    /*//////////////////////////////////////////////////////////////
                              VALID VOTING
    //////////////////////////////////////////////////////////////*/
    function testValidVoting() public {
        ballot.giveRightToVote(alice);
        
        vm.prank(alice);
        ballot.vote(0);

        assertEq(ballot.winnerName(), bytes32(0x6261720000000000000000000000000000000000000000000000000000000000));
    }

    function testAfterVotingPeriod() public {
        ballot.giveRightToVote(bob);
        uint startTime = block.timestamp;

        uint afterTime = startTime + 5 minutes;

        // forward 5 minutes
        vm.warp(afterTime);

        // vote as bob and expect to revert with error VotingPeriodExpired
        vm.prank(bob);
        vm.expectRevert(TimeBoundBallot.VotingPeriodExpired.selector);
        ballot.vote(0);
    }

    function testExample() public {
        assertTrue(true);
    }
}
