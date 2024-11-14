// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract Authetify{
    address owner;
    
    
    //A struct helps create a product Bread 
    struct product{
        string productId;
        string productTimestamp;
        string productName;
        string retailererName;
        string retailerId;
        string retailerLocation;
    }
    
    //A struct create a retailer
    struct retailer{
        string retailererName;
        string retailerId;
        string retailerLocation;
    }
    
    mapping (int => product) productArr;
    mapping (int => product) retailerArr;
    int index = 0;
    
    function addProduct(string memory _productId,string  memory _timeStamp,string memory _productName,string memory _retailerName,string memory _retailerId,string memory _location)  public {
        // product newProduct;
        productArr[index].productId = _productId;
        productArr[index].productName = _productName;
        productArr[index].productTimestamp = _timeStamp;
        productArr[index].retailererName = _retailerName;
        productArr[index].retailerId = _retailerId;
        productArr[index].retailerLocation = _location;
        index++;
    }
    int index1=0;
    function addRetailer(string memory _retailerName,string memory _retailerId,string memory _retailerLocation) public {
        retailerArr[index1].retailererName = _retailerName;
        retailerArr[index1].retailerId = _retailerId;
        retailerArr[index1].retailerLocation = _retailerLocation;
        index1++;
    }

}