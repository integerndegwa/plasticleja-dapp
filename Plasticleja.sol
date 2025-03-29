// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Plasticleja {
    struct PlasticRecord {
        address collector;
        uint256 weight;  // in grams
        string location;
        uint256 timestamp;
    }

    PlasticRecord[] public records;
    mapping(address => uint256) public totalCollected;

    event PlasticCollected(address indexed collector, uint256 weight, string location, uint256 timestamp);

    function reportCollection(uint256 _weight, string memory _location) public {
        require(_weight > 0, "Weight must be greater than zero");

        records.push(PlasticRecord(msg.sender, _weight, _location, block.timestamp));
        totalCollected[msg.sender] += _weight;

        emit PlasticCollected(msg.sender, _weight, _location, block.timestamp);
    }

    function getTotalCollected(address _collector) public view returns (uint256) {
        return totalCollected[_collector];
    }
}

