// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "../common/DataTypes.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Manufacturer is DataTypes {
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
    }

    function getAllManufacturers() public view returns (Manufacturer[] memory) {
        return manufacturers;
    }

    function createManufacturedProd(
        string memory _prodName,
        string[] memory _rawMaterialConsts,
        address _manufacturer,
        uint _unitPrice
    ) public {
        string memory prefix = "manu_prod";
        string memory timestampStr = Strings.toString(block.timestamp);
        string memory prodId = string(abi.encodePacked(prefix, timestampStr));
        manufacturedProd[prodId] = ManufacturedProduct(
            prodId,
            _prodName,
            _rawMaterialConsts,
            _manufacturer,
            _unitPrice
        );

        manufacturedProds.push(ManufacturedProduct(
            prodId,
            _prodName,
            _rawMaterialConsts,
            _manufacturer,
            _unitPrice
        ));
    }

    function getAllManufacturedProds() public view returns (ManufacturedProduct[] memory) {
        return manufacturedProds;
    }

    function createManufacturedProdOrder(
        string[] memory _manufacturedProds,
        string memory _orderDateTime,
        uint _totalPrice,
        address _distributer
    ) public {
        string memory prefix = "manu_prod_order";
        string memory orderId = string(abi.encodePacked(prefix, _orderDateTime));

        manuProdOrder[orderId] = ManufacturedProductOrder(
            orderId,
            _manufacturedProds,
            _orderDateTime,
            _distributer,
            _totalPrice
        );

        manuProdOrders.push(ManufacturedProductOrder(
            orderId,
            _manufacturedProds,
            _orderDateTime,
            _distributer,
            _totalPrice
        ));
    }

    function getAllManufacturedProdOrders() public view returns (ManufacturedProduct[] memory) {
        return manufacturedProds;
    }
}