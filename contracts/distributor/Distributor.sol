// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "../common/DataTypes.sol";
import "../common/Events.sol";

contract Distributor is DataTypes, Events {
    address private admin;

    mapping(address=>Distributer) private distributer;
    Distributer[] public distributers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can access this function.");
        _;
    }

    // Admin-Only
    function createDistributer(address _distributer, string memory _name, string memory _location) public onlyAdmin {
        distributer[_distributer] = Distributer(_name, _distributer, _location);
        distributers.push(Distributer(_name, _distributer, _location));

        emit DistributerAdded(_name, _distributer, _location);
    }

    function getAllDistributers() public view returns (Distributer[] memory) {
        return distributers;
    }
}