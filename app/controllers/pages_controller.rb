class PagesController < ApplicationController
  def home
    @data =
{ "@context": [ "https://w3id.org/credentials/v1","https://w3id.org/security/v1"],
  "type" : [ "Credential" ],
  "claim" : {
    "id" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",
    "publicKey" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1"
  },
  "issuer" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",
  "issued" : "2018-03-15T00:00:00Z"
}
  end
end
