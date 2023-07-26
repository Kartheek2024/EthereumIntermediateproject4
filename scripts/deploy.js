const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying DegenGamingToken contract with the account:", deployer.address);

  // Deploy DegenGamingToken contract
  const DegenGamingToken = await hre.ethers.getContractFactory("DegenGamingToken");
  const degenGamingToken = await DegenGamingToken.deploy(
    "Degen Gaming Token", // Token name
    "DGN", // Token symbol
    0, // Token decimals
    ethers.utils.parseEther("1000") // Initial supply of 1,000 tokens
  );

  await degenGamingToken.deployed();

  console.log("DegenGamingToken contract deployed to:", degenGamingToken.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
