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
  			fill_in "Name",      with: "Example Company"
  			fill_in "Url",   	 with: "www.company.com"
  			fill_in "ID",      	 with: "pepsi"
  			fill_in "Desc",      with: "Computer company"  			
  		end
  		
  		before(:each) do
    		stub_request(:get, "https://graph.facebook.com/pepsi").to_return(:body => { 'username' => 'pepsi'})
  		end 
		
  		describe "correct facebook id" do               
        	#validate fbid
			it "should validate fbid" do   			
      			WebMock.should have_requested(:get, "https://graph.facebook.com/pepsi")
      			Company.validate_fbid('pepsi')['username'].should == "pepsi"
      			
    		end
		
        	#it "should create a company" do 
              #  expect { click_button submit }.to change(Company, :count).by(1)
        	#end
                                        
    	end
  		
  		#describe "wrong facebook id" do   			  			
			#validate fbid
  			#it "should not create a company" do   				
  				#expect { click_button submit }.not_to change(Company, :count)
  			#end
  		#end

  	end
  	 	
  	#describe "with invalid information" do 
  	  			  		         
  		#it "should not create company" do   		
  			#expect { click_button submit }.not_to change(Company, :count)
  		#end
  	#end
  	  	 
  end 
  
    
  
end












