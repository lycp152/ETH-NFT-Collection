const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("MyEpicNFT", function () {
  // 各テストの前に呼び出す関数です。テストで使用する変数やコントラクトのデプロイを行います。
  async function deployMyEpicNFTFixture() {
    // テストアカウントを取得します。
    const [owner] = await ethers.getSigners();

    // コントラクト内で使用する単語の配列を定義します。
    const firstWords = [
      "Ambitious",
      "Beautiful",
      "Charming",
      "Delight",
      "Ethereal",
      "Forever",
      "Gorgeous",
      "Happy",
      "Illustrious",
      "Jubilant",
      "Kindness",
      "Luminous",
      "Mellifluous",
      "Noble",
      "Odyssey",
      "Pure",
      "Quill",
      "Rainbow",
      "Sunrise",
      "Twilight",
      "Universe",
      "Victory",
      "Wonderful",
      "Xenial",
      "Yours",
      "Zenith",
    ];
    const secondWords = [
      "Aurora",
      "Butterfly",
      "Cherish",
      "Dream",
      "Eternal",
      "Fragrance",
      "Grace",
      "Harmony",
      "Innocent",
      "Jupyter",
      "Kindred",
      "Luxury",
      "Melody",
      "Nocturne",
      "Oasis",
      "Passion",
      "Queen",
      "Rose",
      "Sky",
      "Twinkle",
      "Unison",
      "Venus",
      "Wish",
      "Xystus",
      "Yearning",
      "Zealous",
    ];
    const thirdWords = [
      "Aqua",
      "Blossom",
      "Crystal",
      "Destiny",
      "Elegance",
      "Fate",
      "Galaxy",
      "Horizon",
      "Infinity",
      "Joy",
      "Knight",
      "Love",
      "Memory",
      "Nostalgia",
      "Ocean",
      "Peace",
      "Quest",
      "Romance",
      "Smile",
      "Tale",
      "Utopia",
      "Vista",
      "Wizardry",
      "Xanadu",
      "Yarn",
      "Zephyr",
    ];

    // コントラクトのインスタンスを生成し、デプロイを行います。
    const MyEpicNFTFactory = await ethers.getContractFactory("MyEpicNFT");
    const MyEpicNFT = await MyEpicNFTFactory.deploy();

    return { MyEpicNFT, owner, firstWords, secondWords, thirdWords };
  }

  describe("pickRandomFirstWord", function () {
    it("should get strings in firstWords", async function () {
      // テストの準備を行います。
      const { MyEpicNFT, firstWords } = await loadFixture(
        deployMyEpicNFTFixture
      );

      // テストを行う関数を呼び出し、結果を確認します。
      expect(firstWords).to.include(await MyEpicNFT.pickRandomFirstWord(0));
    });
  });

  describe("pickRandomSecondWord", function () {
    it("should get strings in secondWords", async function () {
      const { MyEpicNFT, secondWords } = await loadFixture(
        deployMyEpicNFTFixture
      );

      expect(secondWords).to.include(await MyEpicNFT.pickRandomSecondWord(0));
    });
  });

  describe("pickRandomThirdWord", function () {
    it("should get strings in thirdWords", async function () {
      const { MyEpicNFT, thirdWords } = await loadFixture(
        deployMyEpicNFTFixture
      );

      expect(thirdWords).to.include(await MyEpicNFT.pickRandomThirdWord(0));
    });
  });
});
