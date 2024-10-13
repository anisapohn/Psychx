import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor {
  type Token = {
    symbol: Text;
    name: Text;
    totalSupply: Nat;
  };

  let tokens = HashMap.HashMap<Text, Token>(10, Text.equal, Text.hash);

  public func addToken(symbol: Text, name: Text, totalSupply: Nat) : async () {
    let token : Token = {
      symbol = symbol;
      name = name;
      totalSupply = totalSupply;
    };
    tokens.put(symbol, token);
  };

  public query func getToken(symbol: Text) : async ?Token {
    tokens.get(symbol)
  };

  public query func listTokens() : async [Token] {
    Array.map<(Text, Token), Token>(Array.freeze(tokens.entries()), func((_, token)) = token)
  };

  // Existing swap function
  public func swap(fromToken: Text, toToken: Text, amount: Nat) : async Text {
    // Implement swap logic here
    return "Swapped " # Nat.toText(amount) # " " # fromToken # " to " # toToken;
  };
}
