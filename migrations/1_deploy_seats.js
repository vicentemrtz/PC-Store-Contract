const BlockchainContract = artifacts.require("BlockchainContract");

module.exports = function (deployer) {
  deployer.deploy(BlockchainContract);
}