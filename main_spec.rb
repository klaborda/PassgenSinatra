require 'main'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

Test::Unit::TestCase.send :include, Rack::Test::Methods

set :environment, :test

describe PWDGen do
  
  before(:each) do
    @pw= PWDGen.new(3,4)
  end

  it "should exist" do
    @pw.should_not be_nil
  end
  
  it "should accept an init param" do
    @pw.should_not be_nil
  end

  it "should return a password with .gen_passwd method with length of the second argument" do
    @pw.gen_passwd.length.should == 4
  end
  
  it "should return an array of size first argument with the .gen_passwd_list method" do
    @pw.gen_passwd_list.length.should == 3
  end
end

describe "PassgenSinatra" do
	include Rack::Test::Methods
  
	it "has home page" do
		get '/'
		last_response.should be_ok
		last_response.body.length.should > 0
	end
end
