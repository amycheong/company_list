require 'spec_helper'

describe "Companies" do

  subject { page }
  
  describe "Show page" do 
  	before { visit root_path }
  	it { should have_selector('h1', text:'Companies') }
  	it { should have_link('Register here', href: new_path ) }
  end
  
end
