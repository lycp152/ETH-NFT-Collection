// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
// いくつかの OpenZeppelin のコントラクトをインポートします。
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// インポートした OpenZeppelin のコントラクトを継承しています。
// 継承したコントラクトのメソッドにアクセスできるようになります。
contract MyEpicNFT is ERC721URIStorage {

    // OpenZeppelin が tokenIds を簡単に追跡するために提供するライブラリを呼び出しています
    using Counters for Counters.Counter;

    // _tokenIdsを初期化（_tokenIds = 0）
    Counters.Counter private _tokenIds;

    // NFT トークンの名前とそのシンボルを渡します。
    constructor() ERC721 ("SquareNFT", "SQUARE") {
      console.log("This is my NFT contract.");
    }

    // ユーザーが NFT を取得するために実行する関数です。
    function makeAnEpicNFT() public {

      // NFT が Mint されるときのカウンターをインクリメントします。
      _tokenIds.increment();

      // 現在のtokenIdを取得します。tokenIdは1から始まります。
      uint256 newItemId = _tokenIds.current();

       // msg.sender を使って NFT を送信者に Mint します。
      _safeMint(msg.sender, newItemId);

      // NFT データを設定します。
      _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiRXBpY05mdENyZWF0b3IiLAogICAgImRlc2NyaXB0aW9uIjogIlRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKICAgICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhkb2FYUmxPeUJtYjI1MExXWmhiV2xzZVRvZ2MyVnlhV1k3SUdadmJuUXRjMmw2WlRvZ01UUndlRHNnZlR3dmMzUjViR1UrQ2lBZ0lDQThjbVZqZENCM2FXUjBhRDBpTVRBd0pTSWdhR1ZwWjJoMFBTSXhNREFsSWlCbWFXeHNQU0ppYkdGamF5SWdMejRLSUNBZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU5UQWxJaUJqYkdGemN6MGlZbUZ6WlNJZ1pHOXRhVzVoYm5RdFltRnpaV3hwYm1VOUltMXBaR1JzWlNJZ2RHVjRkQzFoYm1Ob2IzSTlJbTFwWkdSc1pTSStSWEJwWTA1bWRFTnlaV0YwYjNJOEwzUmxlSFErQ2p3dmMzWm5QZz09Igp9");

      // NFTがいつ誰に作成されたかを確認します。
      console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    }
}
