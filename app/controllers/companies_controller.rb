class CompaniesController < ApplicationController
  
  def new
  	@company = Company.new 
  end
  
  def create 
  	@company = Company.new(params[:company])
  	if @company.save 
  		@message = "New company created"
  		render 'show'
  	else 
  		@message = "No company created"
  		render 'new' 
  	end 
  	 	
  end 
  
  def show
  	@companies = Company.all
  end
end
