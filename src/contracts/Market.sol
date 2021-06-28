pragma solidity 0.5.16;

import "./Context.sol";
import "./Approvable.sol";
import "./Vault.sol";
import "./SafeMath.sol";
import "./Burnable.sol";

contract Market is Approvable, Vault, Burnable {
    using SafeMath for uint256;

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    function buy() payable public {
        uint256 amountTobuy = _msgValue();
        uint256 marketBalance = _balanceOfMarket();

        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= marketBalance, "Not enough tokens in the reserve");

        _transfer(address(this), _msgSender(), amountTobuy);
        emit Bought(amountTobuy);
    }

    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");

        uint256 allowance = _allowance(_msgSender(), _vaultAddress());

        require(allowance >= amount, "Check the token allowance");

        uint256 toBurn = amount.div(10);
        uint256 toTransfer = amount - toBurn;

        _transferFrom(_msgSender(), address(this), toTransfer);
        _burn(_msgSender(), toBurn);

        emit Sold(amount);
    }

}