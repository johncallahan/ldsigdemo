require 'ed25519'
require 'json/ld/signature'

class PagesController < ApplicationController
  def home
    @data1 = JSON['{"@context":["http://schema.org/","https://w3id.org/security/v2"],"name":"Manu Sporny","homepage":"https://manu.sporny.org/","image":"https://manu.sporny.org/images/manu.png"}']
    @doc1 = Marshal.load(Marshal.dump(@data1))
    @signer1 = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer1.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @normalized1 = JSON::LD::SIGNATURE::generateNormalizedGraph @data1, {}
    @signed1 = @signer1.sign @data1, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @sig1 = Marshal.load(Marshal.dump(@data1))
    @signed1_hash = JSON.parse(@signed1)
    @signatureValue1 = @signed1_hash['signature']['signatureValue']
    @verifier1 = JSON::LD::SIGNATURE::Ed25519Verifier.new
    @verifier1.pub = Ed25519::VerifyKey.new ["ff1a646cc8b69fcb522aa1ed162bc2816878252a634384ce46f7507bfc92f68f"].pack('H*')
    @valid1 = @verifier1.verify @signed1, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}

    @data2 = JSON['{"@context":["http://schema.org/","https://w3id.org/security/v2"],"name":"Manu Sporny","foo":"bar","homepage":"https://manu.sporny.org/","image":"https://manu.sporny.org/images/manu.png"}']
    @doc2 = Marshal.load(Marshal.dump(@data2))
    @signer2 = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer2.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @normalized2 = JSON::LD::SIGNATURE::generateNormalizedGraph @data2, {}
    @signed2 = @signer2.sign @data2, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @sig2 = Marshal.load(Marshal.dump(@data2))
    @signed2_hash = JSON.parse(@signed2)
    @signatureValue2 = @signed2_hash['signature']['signatureValue']
    @verifier2 = JSON::LD::SIGNATURE::Ed25519Verifier.new
    @verifier2.pub = Ed25519::VerifyKey.new ["ff1a646cc8b69fcb522aa1ed162bc2816878252a634384ce46f7507bfc92f68f"].pack('H*')
    @valid2 = @verifier2.verify @signed2, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}

    @data3 = JSON['{"@context":["http://schema.org/","https://w3id.org/security/v2"],"name":"Manu Sporny","homepage":"https://manu.sporny.org/","image":"https://manu.sporny.org/images/manu.png","nonce" : "0123456789"}']
    @doc3 = Marshal.load(Marshal.dump(@data3))
    @signer3 = JSON::LD::SIGNATURE::Ed25519Signer.new
    @signer3.priv = Ed25519::SigningKey.new ["7f702a609f842057be24b5297e451662876f03b047d660362cd123f71d2a3b63"].pack('H*')
    @normalized3 = JSON::LD::SIGNATURE::generateNormalizedGraph @data3, {}
    @signed3 = @signer3.sign @data3, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}
    @sig3 = Marshal.load(Marshal.dump(@data3))
    @signed3_hash = JSON.parse(@signed3)
    @signatureValue3 = @signed3_hash['signature']['signatureValue']
    @verifier3 = JSON::LD::SIGNATURE::Ed25519Verifier.new
    @verifier3.pub = Ed25519::VerifyKey.new ["ff1a646cc8b69fcb522aa1ed162bc2816878252a634384ce46f7507bfc92f68f"].pack('H*')
    @valid3 = @verifier3.verify @signed3, { 'creator' => 'did:v1:test:nym:JApJf12r82Pe6PBJ3gJAAwo8F7uDnae6B4ab9EFQ7XXk#authn-key-1'}

    @data4 = JSON['{"@context":["http://schema.org/","https://w3id.org/security/v2"],"name":"Manu Sporny","homepage":"https://manu.sporny.org/","image":"https://manu.sporny.org/images/manu.png"}']
    @doc4 = Marshal.load(Marshal.dump(@data4))
    @signer4 = JSON::LD::SIGNATURE::RsaSigner.new
    @signer4.priv = OpenSSL::PKey::RSA.new File.read 'data/priv_key.pem'
    @normalized4 = JSON::LD::SIGNATURE::generateNormalizedGraph @data4, {}
    @signed4 = @signer4.sign @data4, { 'creator' => 'http://example.com/foo/key/1'}
    @sig4 = Marshal.load(Marshal.dump(@data4))
    @signed4_hash = JSON.parse(@signed4)
    @signatureValue4 = @signed4_hash['signature']['signatureValue']
    @verifier4 = JSON::LD::SIGNATURE::RsaVerifier.new
    @verifier4.pub = OpenSSL::PKey::RSA.new File.read 'data/pub_key.pem'
    @valid4 = @verifier4.verify @signed4, { 'creator' => 'http://example.com/foo/key/1'}
  end
end
