/**

 */
import Result "mo:base/Result";

import ExtCore "./Core";
module ExtCommon = {
  public type Location = {
      #InCanister: Blob; // NFT encoded data
      #AssetCanister: (Principal, Blob); // asset canister id, storage key
      #IPFS: Text; // IPFS content hash
      #Web: Text; // URL pointing to the file
  };
  public type Attribute = {
      key: Text;
      value: Text;
  };
  public type TokenMetadata = {
      filetype: Text; // jpg, png, mp4, etc.
      location: Location;
      attributes: [Attribute];
  };
  public type Metadata = {
    #fungible : {
      name : Text;
      symbol : Text;
      decimals : Nat8;
      metadata : ?Blob;
    };
    #nonfungible : {
      metadata : ?TokenMetadata;
    };
  };
  
  public type Service = actor {
    metadata: query (token : ExtCore.TokenIdentifier) -> async Result.Result<Metadata, ExtCore.CommonError>;

    supply: query (token : ExtCore.TokenIdentifier) -> async Result.Result<ExtCore.Balance, ExtCore.CommonError>;
  };
};