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
 
  	
  	describe "with valid information" do 
  		before do 
  			fill_in "Name",      with: "Example company"
  			fill_in "Url",   	 with: "www.company.com"
  			fill_in "ID",      	 with: "pepsi"
  			fill_in "Desc",      with: "Company desc"  			
  		end
		let(:company){ Company.new(name:'Example Company', url: 'www.company.com', fbid: 'pepsi', desc: 'Company desc' )}
		
  		it "should create a company after validation" do
  		   #Company.stub(:validate_fbid).and_return('pepsi')
  		   #company.fbid.should == 'pepsi'	 
           expect { company.save }.to change(Company, :count).by(1)
           #company.save.should == true
       	end
        	
   	end
  	 	
  	describe "with invalid information" do 
  	  			  		         
  		it "should not create company" do   		
  			expect { click_button submit }.not_to change(Company, :count)
  		end
  	end
  	  	 
  end 
  
    
  
end












