const hre = require("hardhat");

async function main() {
    const [owner] = await hre.ethers.getSigners(); // Lấy tài khoản deployer
    const tokenAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";  // Địa chỉ contract token
    const recipient = "0x8404dbA8df49E3183Bae3678df1c53690f1C8Ab8";  // Địa chỉ ví MetaMask

    const MyToken = await hre.ethers.getContractAt("BidiTOKEN", tokenAddress);
    

    const amount = hre.ethers.parseUnits("0.5", 18); 

    console.log(`🔄 Sending ${hre.ethers.formatUnits(amount, 18)} MTK to ${recipient}...`);

    const tx = await MyToken.transfer(recipient, amount);
    await tx.wait(); 
    
    console.log(`✅ Sent ${hre.ethers.formatUnits(amount, 18)} MTK successfully!`);
}

main().catch((error) => {
    console.error("❌ Error sending token:", error);
    process.exitCode = 1;
});
