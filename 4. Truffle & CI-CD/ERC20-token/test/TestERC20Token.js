const { BN, expectRevert, expectEvent } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');
//const { assert } = require('console');
const ERC20 = artifacts.require('ERC20Token');

contract('ERC20', function (accounts) {

  const _name = 'ALYRA';
  const _symbol = 'ALY';
  const _initialsupply = new BN(1000);
  const _decimals = new BN(18);
  const owner = accounts[0];
  const recipient = accounts[1];
  const spender = accounts[2];
  
  describe ("Test all", function() {
    let ERC20Instance;
    before(async function () {
      ERC20Instance = await ERC20.new(_initialsupply,{from: owner});
    });
    
    it ("should have name as ALYRA", async() => {
      const name = await ERC20Instance.name();
      expect (name).to.equal(_name);
      
      assert.equal(name, _name);
    });

    it ("should have symbol as ALY", async() => {
      expect (await ERC20Instance.symbol()).to.equal(_symbol);
    });

    it("should have decimals", async() => {
      expect(await ERC20Instance.decimals()).to.be.bignumber.equal(_decimals);
    })

    it ("should transfer", async() => {
      const amount = new BN(10);
      const balanceOfOwnerBeforeTransfer = await ERC20Instance.balanceOf(owner);
      const balanceOfRecipientBeforeTransfer = await ERC20Instance.balanceOf(recipient);
      await ERC20Instance.transfer(recipient, amount);
      expect(await ERC20Instance.balanceOf(owner)).to.be.bignumber.equal(balanceOfOwnerBeforeTransfer.sub(amount));
      expect(await ERC20Instance.balanceOf(recipient)).to.be.bignumber.equal(balanceOfRecipientBeforeTransfer.add(amount));
    })

    it("should revert transfer", async() => {
      await expectRevert(ERC20Instance.transfer(recipient, new BN(999999999)), "ERC20: transfer amount exceeds balance");

    })

    it('vérifie si un approve est bien effectué', async function (){
      const amount = new BN(10);
      const allowanceBeforeApprove = await ERC20Instance.allowance( owner, spender);
      await ERC20Instance.approve(spender, amount, {from: owner});
      expect(await ERC20Instance.allowance( owner, spender)).to.be.bignumber.equal(amount);
    });


    it("vérifie un transferFrom", async() => {
      const amount = new BN(10);
      const balanceOfOwnerBeforeTransfer = await ERC20Instance.balanceOf(owner);
      const balanceOfRecipientBeforeTransfer = await ERC20Instance.balanceOf(recipient);
      await ERC20Instance.approve(spender, amount, {from: owner});
      
      await ERC20Instance.transferFrom(owner, recipient, amount, {from: spender});

      expect(await ERC20Instance.balanceOf(owner)).to.be.bignumber.equal(balanceOfOwnerBeforeTransfer.sub(amount));
      expect(await ERC20Instance.balanceOf(recipient)).to.be.bignumber.equal(balanceOfRecipientBeforeTransfer.add(amount));

    })

  });


  
});
