/**

 */
import Result "mo:base/Result";
import ExtCore "./Core";
import ExtCommon "./Common";
module ExtNonFungible = {
  public type MintRequest = {
    to : ExtCore.User;
    metadata : ?ExtCommon.TokenMetadata;
  };
  public type Service = actor {
    bearer: query (token : ExtCore.TokenIdentifier) -> async Result.Result<ExtCore.AccountIdentifier, ExtCore.CommonError>;

    mintNFT: shared (request : MintRequest) -> async ();
  };
};
