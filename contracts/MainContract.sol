//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./supplier/Supplier.sol";
import "./manufacturer/Manufacturor.sol";
import "./distributor/Distributor.sol";
import "./common/DataTypes.sol";

contract MainContract is DataTypes {
    Supplier private supplier;
    Manufacturor private manufacturer;
    Distributor private distributor;

    constructor() {
        supplier = new Supplier();
        manufacturer = new Manufacturor();
        distributor = new Distributor();
    }

    // Admin-Only
    function createRawMaterialSupplier(address _supplier, string memory _name, string memory _location) public {
        supplier.createRawMaterialSupplier(_supplier, _name, _location);
    }

    function getAllSuppliers() public view returns (RawMaterialSupplier[] memory) {
        return supplier.getAllSuppliers();
    }

    function getSupplierByPublicAddress(address _supplier) public view returns (RawMaterialSupplier memory) {
        return supplier.getSupplierByPublicAddress(_supplier);
    }

    function createRawMaterial(
        string memory _materialName,
        string memory _materialSource,
        uint _unitPrice,
        address _creator,
        string memory _materialId
    ) public {
        supplier.createRawMaterial(_materialName, _materialSource, _unitPrice, _creator, _materialId);
    }

    function getAllRawMaterials() public view returns (RawMaterial[] memory) {
        return supplier.getAllRawMaterials();
    }

    function createRawMaterialOrder(
        string[] memory _rawMaterials,
        string memory _orderDateTime,
        uint _totalPrice,
        address _manufacturer,
        string memory _orderId
    ) public {
        supplier.createRawMaterialOrder(_rawMaterials, _orderDateTime, _totalPrice, _manufacturer, _orderId);
    }

    function getAllRawMaterialOrders() public view returns (RawMaterialOrder[] memory) {
        return supplier.getAllRawMaterialOrders();
    }

    // Admin-Only
    function createManufacturer(address _manufacturer, string memory _name, string memory _location) public {
        manufacturer.createManufacturer(_manufacturer, _name, _location);
    }

    function getAllManufacturers() public view returns (Manufacturer[] memory) {
        return manufacturer.getAllManufacturers();
    }

    function createManufacturedProd(
        string memory _prodName,
        string[] memory _rawMaterialConsts,
        address _manufacturer,
        uint _unitPrice
    ) public {
        manufacturer.createManufacturedProd(_prodName, _rawMaterialConsts, _manufacturer, _unitPrice);
    }

    function getAllManufacturedProds() public view returns (ManufacturedProduct[] memory) {
        return manufacturer.getAllManufacturedProdOrders();
    }

    function createManufacturedProdOrder(
        string[] memory _manufacturedProds,
        string memory _orderDateTime,
        uint _totalPrice,
        address _distributer
    ) public {
        manufacturer.createManufacturedProdOrder(_manufacturedProds, _orderDateTime, _totalPrice, _distributer);
    }

    function getAllManufacturedProdOrders() public view returns (ManufacturedProduct[] memory) {
        return manufacturer.getAllManufacturedProdOrders();
    }

    // Admin-Only
    function createDistributer(address _distributer, string memory _name, string memory _location) public {
        distributor.createDistributer(_distributer, _name, _location);
    }

    function getAllDistributers() public view returns (Distributer[] memory) {
        return distributor.getAllDistributers();
    }
}