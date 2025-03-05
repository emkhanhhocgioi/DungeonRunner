const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("BidiTOKEN", function () {
  let BidiTOKEN, bidiToken, owner, addr1, addr2;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    
    const initialReward = ethers.parseEther("10"); 
  

    BidiTOKEN = await ethers.getContractFactory("BidiTOKEN");
    bidiToken = await BidiTOKEN.deploy(initialReward);
   
  });

  it("Should have correct name and symbol", async function () {
    expect(await bidiToken.name()).to.equal("BidiTOKEN");
    expect(await bidiToken.symbol()).to.equal("BIDI");
  });

  it("Should mint initial supply to owner", async function () {
    const ownerBalance = await bidiToken.balanceOf(owner.address);
    expect(ownerBalance).to.equal(ethers.parseEther("100000000"));
  });

  it("Should allow owner to mint tokens", async function () {
    const mintAmount = ethers.parseEther("1000");
    
    await bidiToken.mint(addr1.address, mintAmount);

    const addr1Balance = await bidiToken.balanceOf(addr1.address);
    expect(addr1Balance).to.equal(mintAmount);
  });

  it("Should prevent non-owner from minting", async function () {
    const mintAmount = ethers.parseEther("1000");
  
    await expect(bidiToken.connect(addr1).mint(addr2.address, mintAmount))
      .to.be.revertedWithCustomError(bidiToken, "OwnableUnauthorizedAccount")
      .withArgs(addr1.address); 
  });
  

  it("Should allow owner to burn tokens", async function () {
    const burnAmount = ethers.parseEther("1000");
    await bidiToken.burn(burnAmount);

    const ownerBalance = await bidiToken.balanceOf(owner.address);
    expect(ownerBalance).to.equal(ethers.parseEther("99999000")); // 100 triệu - 1000
  });

  it("Should prevent non-owner from burning tokens", async function () {
    const burnAmount = ethers.parseEther("1000");
    await expect(bidiToken.connect(addr1).burn(burnAmount))
      .to.be.revertedWith("Ownable: caller is not the owner");
  });

  it("Should have correct block reward", async function () {
    const reward = await bidiToken.blockReward();
    expect(reward).to.equal(ethers.parseEther("1"));
  });

});
