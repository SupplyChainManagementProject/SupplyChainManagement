// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "../common/DataTypes.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Supplier is DataTypes {
    address private admin;

    mapping(address=>RawMaterialSupplier) private rawMaterialSupplier;
    RawMaterialSupplier[] public suppliers;

    mapping(string=>RawMaterial) private rawMaterial;
    RawMaterial[] public rawMaterials;

    mapping(string=>RawMaterialOrder) private rawMaterialOrder;
    RawMaterialOrder[] public rawMaterialOrders;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can access this function.");
        _;
    }

    // Admin-Only
    function createRawMaterialSupplier(address _supplier, string memory _name, string memory _location) public onlyAdmin {
        rawMaterialSupplier[_supplier] = RawMaterialSupplier(_name, _supplier, _location);
        suppliers.push(RawMaterialSupplier(_name, _supplier, _location));
    }

    function getAllSuppliers() public view returns (RawMaterialSupplier[] memory) {
        return suppliers;
    }

    function createRawMaterial(
        string memory _materialName,
        string memory _materialSource,
        uint _unitPrice,
        address _creator
    ) public {
        string memory prefix = "raw_mat";
        string memory timestampStr = Strings.toString(block.timestamp);
        string memory materialId = string(abi.encodePacked(prefix, timestampStr));
        rawMaterial[materialId] = RawMaterial(
            materialId,
            _materialName,
            _materialSource,
            _creator,
            _unitPrice
        );

        rawMaterials.push(RawMaterial(
            materialId,
            _materialName,
            _materialSource,
            _creator,
            _unitPrice
        ));
    }

    function getAllRawMaterials() public view returns (RawMaterial[] memory) {
        return rawMaterials;
    }

    function createRawMaterialOrder(
        string[] memory _rawMaterials,
        string memory _orderDateTime,
        uint _totalPrice,
        address _manufacturer
    ) public {
        string memory prefix = "raw_mat_order";
        string memory materialId = string(abi.encodePacked(prefix, _orderDateTime));

        rawMaterialOrder[materialId] = RawMaterialOrder(
            materialId,
            _rawMaterials,
            _orderDateTime,
            _totalPrice,
            _manufacturer
        );

        rawMaterialOrders.push(RawMaterialOrder(
            materialId,
            _rawMaterials,
            _orderDateTime,
            _totalPrice,
            _manufacturer
        ));
    }

    function getAllRawMaterialOrders() public view returns (RawMaterialOrder[] memory) {
        return rawMaterialOrders;
    }
}
