import React from 'react';
import Web3 from 'web3';
// import ContractAbi  from '../abi/MyToken';
import ContractAbi  from '../abi/Example';

const web3 = new Web3(Web3.givenProvider || 'http://127.0.0.1:9545/');
const contractAddr = '0x5287A145e2ECFdB7e015e6A36F820305ecA1716d';
const EtherContract = new web3.eth.Contract(ContractAbi, contractAddr);

console.log(EtherContract.methods)

export default function Home() {
  const [number, setNumber] = React.useState(0);
  const [getNumber, setGetNumber] = React.useState('0x00');

  const handleSet = async (e) => {
    e.preventDefault();

    const accounts = await window.ethereum.enable();
    const account = accounts[0];
    const gas = await EtherContract.methods.set(number)
        .estimateGas();
    const result = await EtherContract.methods.set(number).send({
      from: account,
      gas
    })

    console.log(result);
  }

  const handleGet = async (e) => {
    e.preventDefault();

    const result = await EtherContract.methods.get().call();
    setGetNumber(result);

    console.log(result);
  }

  return (
      <div>
        <header>
          <form onSubmit={handleSet}>
            <label>
              Set Number:
              <input
                  type="text"
                  name="name"
                  value={number}
                  onChange={ e => setNumber(+e.target.value) } />
            </label>
            <input type="submit" value="Set Number" />
          </form>
          <br/>
          <button
              onClick={handleGet}
              type="button" >
            Get Number
          </button>
          { getNumber }
        </header>
      </div>
  )
}
