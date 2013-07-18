require 'spec_helper'

describe Company do
  before do
    @company = Company.new(name: "Example Company", url: "www.company.com", 
    					fbid: "companyid", desc: "Computer company")
  end
  
  subject { @company }
  
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:fbid) }
  it { should respond_to(:desc) }
  
  
 #when attributes not present 
  describe "when name is not present" do
    before { @company.name = " " }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @company.url = " " }
    it { should_not be_valid }
  end

  describe "when fbid is not present" do
    before { @company.fbid = " " }
    it { should_not be_valid }
  end

  describe "when desc is not present" do
    before { @company.desc = " " }
    it { should_not be_valid }
  end
  
  #url format specs
  describe "when url format is invalid" do
     it "should be invalid" do 
        urls = %w[www.company,com company_at_foo@gmail example.foo@bar_baz.com foo@bar+bar.com]
        urls.each do |invalid_url|
           @company.url = invalid_url
           @company.should_not be_valid
        end
     end
  end

  describe "when url format is valid" do
     it "should be valid" do
        urls = %w[www.company.COM www.companyA.org http://www.google.com ]
        urls.each do |valid_url|
           @company.url = valid_url
           @company.should be_valid
        end
     end
  end
  
  
 
end
