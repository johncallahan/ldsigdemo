require 'ed25519'
require 'json/ld/signature'

class PagesController < ApplicationController
  def home
    @data = JSON['{ "@context": [ "https://w3id.org/credentials/v1","https://w3id.org/security/v1"],  "type" : [ "Credential" ],  "claim" : {    "id" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",    "publicKey" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1"  },  "issuer" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",  "issued" : "2018-03-15T00:00:00Z"}']
    @signer = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @signed = @signer.sign @data, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @signed_hash = JSON.parse(@signed)
    @signatureValue = @signed_hash['signature']['signatureValue']

    @data2 = JSON['{ "@context": [ "https://w3id.org/credentials/v1","https://w3id.org/security/v1"],  "type" : [ "Credential" ],  "claim" : {    "id" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",    "publicKey" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1"  },  "foo" : "bar", "issuer" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",  "issued" : "2018-03-15T00:00:00Z"}']
    @signer2 = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer2.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @signed2 = @signer2.sign @data2, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @signed2_hash = JSON.parse(@signed2)
    @signatureValue2 = @signed2_hash['signature']['signatureValue']

    @data3 = JSON['{ "@context": [ "https://w3id.org/credentials/v1","https://w3id.org/security/v1"],  "type" : [ "Credential" ],  "claim" : {    "id" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",    "publicKey" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1"  },  "nonce" : "somerandomvalue", "issuer" : "did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk",  "issued" : "2018-03-15T00:00:00Z"}']
    @signer3 = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer3.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @signed3 = @signer3.sign @data3, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @signed3_hash = JSON.parse(@signed3)
    @signatureValue3 = @signed3_hash['signature']['signatureValue']
  end
end
