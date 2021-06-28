pragma solidity 0.5.16;

import "./Context.sol";
import "./Ownable.sol";
import "./Vault.sol";
import "./Token.sol";
import "./SafeMath.sol";

contract Mintable is Context, Token, Ownable, Vault {
    /**
   * @dev Creates `amount` tokens and assigns them to `msg.sender`, increasing
   * the total supply.
   *
   * Requirements
   *
   * - `msg.sender` must be the token owner
   */
    function mint(uint256 amount) public onlyOwner returns (bool) {
        _mint(_vaultAddress(), amount);
        return true;
    }


    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(_vaultAddress(), account, amount);
    }
}