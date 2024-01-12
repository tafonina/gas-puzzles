// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySort {
    function sortArray(uint256[] memory data) external pure returns (uint256[] memory) {
        uint256 dataLen = data.length;

        uint256 j;
        uint256 temp;
        uint256 dj;
        uint256 di;
        for (uint i = 0; i < dataLen;) {
            for (j = i + 1; j < dataLen;) {
                dj = data[j];
                di = data[i];
                if(di > dj){
                    temp = di;
                    data[i] = dj;
                    data[j] = temp;
                }
                unchecked {
                    j++;
                }
            }
            unchecked {
                i++;
            }
        }
        return data;
    }
}
