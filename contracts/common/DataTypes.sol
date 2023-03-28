//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DataTypes {
    struct RawMaterialSupplier{
        string name;
        address rawMatSupplierAddress;
        string location;
    }

    struct Manufacturer {
        string name;
        address manuFacturerAddress;
        string location;
    }

    struct Distributer {
        string name;
        address distributerAddress;
        string location;
    }

    struct RawMaterial {
        string materialId;
        string materialName;
        string materialSource;
        address creator;
        uint origUnitPrice;
    }

    struct RawMaterialOrder {
        string orderId;
        string[] rawMaterials; // list of materialId
        string orderDateTime;
        uint totalPrice;
        address manufacturer;
    }

    struct ManufacturedProduct {
        string prodId;
        string productName;
        string[] rawMaterialConstituents; // list of materialId's of rawMaterials used
        address _manufacturer;
        uint originalPrice;
    }

    struct ManufacturedProductOrder {
        string orderId;
        string[] manufacturedProducts; // list of prodId's of manufactured products
        string orderDateTime;
        address _distributer;
        uint totalPrice;
    }
}