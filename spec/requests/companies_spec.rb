require 'spec_helper'

describe "Companies" do

  subject { page }
  
  describe "Show page" do 
  	before { visit root_path }
  	it { should have_selector('h1', text:'Companies') }
  	it { should have_link('Register here', href: new_path ) }
  end
  
  describe "New page" do 
  	before { visit new_path }
  	it { should have_selector('h1', text:'New Company') }
  end 
  
  describe "new company create" do 
  	before { visit new_path }
  	let(:submit){ "Create company" }
  	
  	describe "with invalid information" do 
  		it "should not create company" do 
  			expect { click_button submit }.not_to change(Company, :count)
  		end
  	end
  	
  	describe "with valid information" do 
  		before do 
  			fill_in "Name",      with: "Example Company"
  			fill_in "Url",   	 with: "www.company.com"
  			fill_in "ID",      	 with: "examplecompany"
  			fill_in "Desc",      with: "Computer company"
  		end
  		
  		it "should create a company" do 
  			expect { click_button submit }.to change(Company, :count).by(1)
  		end
  	end 
  end 
  
end












