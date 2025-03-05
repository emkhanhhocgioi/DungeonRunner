const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contract with account:", deployer.address);

  const initialReward = 10; 
  const BidiTOKEN = await hre.ethers.getContractFactory("BidiTOKEN");
  const bidiToken = await BidiTOKEN.deploy(initialReward); 

  console.log(`✅ BidiTOKEN deployed at address: ${bidiToken.target}`); 
}

main().catch((error) => {
  console.error("❌ Deployment failed:", error);
  process.exitCode = 1;
});
