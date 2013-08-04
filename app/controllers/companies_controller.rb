require 'delayed_job'


class CompaniesController < ApplicationController
  
  def new
  		@company = Company.new
  		 
  end
  
  def create 
  		company = Company.new(params[:company])
  		
  		if company.save 
  			company.update_likes
  			redirect_to root_path, :notice =>"New company created."
  		else 
 			redirect_to new_path, :notice =>"Company create attempt failed. Please try again." 
  		end  	  	 	
  end 
  
  def index
  		@companies = Company.toplikes
  		
  end
 
end
