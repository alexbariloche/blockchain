var Checking = artifacts.require("./Checking.sol");

module.exports = function(deployer) {
	deployer.deploy(Checking);
};