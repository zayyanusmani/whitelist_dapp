//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // ()  8  9  0  j

    function addAddressToWhitelist() public {
        // if a person is already in the whitelist then throw the error
        // it ahs to be false. if it is true then it should show an error
        require(
            !whitelistedAddresses[msg.sender],
            "sender already in the whitelist"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Whitelist limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
