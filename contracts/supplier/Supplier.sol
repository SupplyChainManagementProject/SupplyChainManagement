// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "../common/DataTypes.sol";
import "../common/Events.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Supplier is DataTypes, Events {
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

        emit SupplierAdded(_name, _supplier, _location);
    }

    function getAllSuppliers() public view returns (RawMaterialSupplier[] memory) {
        return suppliers;
    }

    function getSupplierByPublicAddress(address _supplier) public view returns (RawMaterialSupplier memory) {
        return rawMaterialSupplier[_supplier];
    }

    function createRawMaterial(
        string memory _materialName,
        string memory _materialSource,
        uint _unitPrice,
        address _creator,
        string memory _materialId
    ) public {
        // string memory prefix = "raw_mat";
        // string memory timestampStr = Strings.toString(block.timestamp);
        // string memory materialId = string(abi.encodePacked(prefix, timestampStr));
        rawMaterial[_materialId] = RawMaterial(
            _materialId,
            _materialName,
            _materialSource,
            _creator,
            _unitPrice
        );

        rawMaterials.push(RawMaterial(
            _materialId,
            _materialName,
            _materialSource,
            _creator,
            _unitPrice
        ));

        emit RawMaterialCreated(_materialId, _materialName, _materialSource, _creator, _unitPrice);
    }

    function getAllRawMaterials() public view returns (RawMaterial[] memory) {
        return rawMaterials;
    }

    function getRawMaterialById(string memory _materialId) public view returns (RawMaterial memory) {
        return rawMaterial[_materialId];
    }

    function createRawMaterialOrder(
        string[] memory _rawMaterials,
        uint[] memory _quantities,
        string memory _orderDateTime,
        uint _totalPrice,
        address _manufacturer,
        address _supplier,
        string memory _orderId
    ) public {
        // string memory prefix = "raw_mat_order";
        // string memory orderId = string(abi.encodePacked(prefix, _orderDateTime));

        rawMaterialOrder[_orderId] = RawMaterialOrder(
            _orderId,
            _rawMaterials,
            _quantities,
            _orderDateTime,
            _totalPrice,
            _manufacturer,
            _supplier
        );

        rawMaterialOrders.push(RawMaterialOrder(
            _orderId,
            _rawMaterials,
            _quantities,
            _orderDateTime,
            _totalPrice,
            _manufacturer,
            _supplier
        ));

        emit RawMaterialOrderCreated(_orderId, _orderDateTime, _totalPrice, _manufacturer, _supplier);
    }

    function getAllRawMaterialOrders() public view returns (RawMaterialOrder[] memory) {
        return rawMaterialOrders;
    }

    function getRawMaterialOrderById(string memory _orderId) public view returns (RawMaterialOrder memory) {
        return rawMaterialOrder[_orderId];
    }
}