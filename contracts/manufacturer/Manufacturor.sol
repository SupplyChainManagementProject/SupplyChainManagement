// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "../common/DataTypes.sol";
import "../common/Events.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Manufacturor is DataTypes, Events {
    address private admin;

    mapping(address=>Manufacturer) private manufacturer;
    Manufacturer[] public manufacturers;

    mapping(string=>ManufacturedProduct) private manufacturedProd;
    ManufacturedProduct[] public manufacturedProds;

    mapping(string=>ManufacturedProductOrder) private manuProdOrder;
    ManufacturedProductOrder[] public manuProdOrders;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can access this function.");
        _;
    }

    // Admin-Only
    function createManufacturer(address _manufacturer, string memory _name, string memory _location) public onlyAdmin {
        manufacturer[_manufacturer] = Manufacturer(_name, _manufacturer, _location);
        manufacturers.push(Manufacturer(_name, _manufacturer, _location));

        emit ManufacturerAdded(_name, _manufacturer, _location);
    }

    function getAllManufacturers() public view returns (Manufacturer[] memory) {
        return manufacturers;
    }

    function getManufacturerByPublicAddress(address _manufacturer) public view returns(Manufacturer memory) {
        return manufacturer[_manufacturer];
    }

    function createManufacturedProd(
        string memory _prodName,
        string[] memory _rawMaterialConsts,
        address _manufacturer,
        uint _unitPrice,
        string memory _prodId
    ) public {
        // string memory prefix = "manu_prod";
        // string memory timestampStr = Strings.toString(block.timestamp);
        // string memory prodId = string(abi.encodePacked(prefix, timestampStr));
        manufacturedProd[_prodId] = ManufacturedProduct(
            _prodId,
            _prodName,
            _rawMaterialConsts,
            _manufacturer,
            _unitPrice
        );

        manufacturedProds.push(ManufacturedProduct(
            _prodId,
            _prodName,
            _rawMaterialConsts,
            _manufacturer,
            _unitPrice
        ));

        emit ProductCreated(_prodId, _prodName, _manufacturer, _unitPrice);
    }

    function getAllManufacturedProds() public view returns (ManufacturedProduct[] memory) {
        return manufacturedProds;
    }

    function getManufacturedProductById(string memory _prodId) public view returns (ManufacturedProduct memory) {
        return manufacturedProd[_prodId];
    }

    function createManufacturedProdOrder(
        string[] memory _manufacturedProds,
        uint[] memory _quantity,
        string memory _orderDateTime,
        uint _totalPrice,
        address _distributer,
        address _manufacturer,
        string memory _orderId
    ) public {
        // string memory prefix = "manu_prod_order";
        // string memory orderId = string(abi.encodePacked(prefix, _orderDateTime));

        manuProdOrder[_orderId] = ManufacturedProductOrder(
            _orderId,
            _manufacturedProds,
            _quantity,
            _orderDateTime,
            _distributer,
            _manufacturer,
            _totalPrice
        );

        manuProdOrders.push(ManufacturedProductOrder(
            _orderId,
            _manufacturedProds,
            _quantity,
            _orderDateTime,
            _distributer,
            _manufacturer,
            _totalPrice
        ));

        emit ProductOrderCreated(_orderId, _orderDateTime, _distributer, _manufacturer, _totalPrice);
    }

    function getAllManufacturedProdOrders() public view returns (ManufacturedProduct[] memory) {
        return manufacturedProds;
    }

    function getManufacturedProdOrderById(string memory _orderId) public view returns (ManufacturedProductOrder memory) {
        return manuProdOrder[_orderId];
    }
}