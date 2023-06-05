const BlockchainContract = artifacts.require("BlockchainContract");

contract("BlockchainContract", () => {

  before(async () => {
    this.blockchainContract = await BlockchainContract.deployed();
  });

  if("successful deploy", async () => {
    const address = this.blockchainContract.address;
    assert.notEqual(address, null);
    assert.notEqual(address, undefined);
    assert.notEqual(address, "");
  });

});
