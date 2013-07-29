

class CompaniesController < ApplicationController
  
  def new
  		@company = Company.new 
  end
  
  def create 
  		company = Company.new(params[:company])
  		
  		if company.save 
  			@message = "New company created."
  			redirect_to root_path
  		else 
  			@message = "Company create attempt failed. Please try again."
 			redirect_to new_path 
  		end  	  	 	
  end 
  
  def index
  		@companies = Company.all
  end
 
end
