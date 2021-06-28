pragma solidity 0.5.16;

contract Token {
    uint256 internal _totalSupply;
    uint8 internal _decimals;
    string internal _symbol;
    string internal _name;

    /**
     * @dev See {BEP20-totalSupply}.
     */
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
}
