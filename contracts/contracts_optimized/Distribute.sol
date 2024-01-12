// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address immutable contributor1;
    address immutable contributor2;
    address immutable contributor3;
    address immutable contributor4;

    uint256 immutable endTime;

    constructor(address[4] memory _contributors) payable {
        contributor1 = _contributors[0];
        contributor2 = _contributors[1];
        contributor3 = _contributors[2];
        contributor4 = _contributors[3];
        endTime = block.timestamp + 1 weeks;
    }

    function distribute() external {
        require(
            block.timestamp > endTime,
            "cannot distribute yet"
        );

        uint256 amount = address(this).balance >> 2;
        payable(contributor1).transfer(amount);
        payable(contributor2).transfer(amount);
        payable(contributor3).transfer(amount);
        selfdestruct(payable(contributor4));
    }
}
