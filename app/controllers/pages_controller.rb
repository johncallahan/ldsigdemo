class PagesController < ApplicationController
  def home
    @data = JSON['{ "@context": [ "https://w3id.org/credentials/v1","https://w3id.org/security/v1"],  "type" : [ "Credential" ],  "claim" : {    "id" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",    "publicKey" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1"  },  "issuer" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",  "issued" : "2018-03-15T00:00:00Z"}']
    @signer = JSON::LD::SIGNATURE::ED25519::Signer.new
    @signer.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @signed = @signer.sign @data, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @signed_hash = JSON.parse(@signed)
    @signatureValue = @signed_hash['signature']['signatureValue']
  end
end
