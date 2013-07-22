require 'rubygems'
require 'json'
require 'net/http'

class CompaniesController < ApplicationController
  
  def new
  	@company = Company.new 
  end
  
  def create 
  	@company = Company.new(params[:company])
  	
  	uri = URI("http://graph.facebook.com/" + @company.fbid)
  	data = Net::HTTP.get(uri)
  	username = JSON.parse(data)['username']
  	if username
  	 	if @company.name.downcase == username.downcase
  			if @company.save 
  				@message = "New company created."
  				redirect_to root_path
  			else 
  				@message = "Company create attempt failed. Please try again."
 				render 'new' 
  			end 
  		else 
  			@message = "Company create attempt failed. Invalid facebook id."
 			render 'new' 
  		end
  	else 
  		@message = "Company create attempt failed. No such facebook id."
  		render 'new'  		 	
  	end  	  	 	
  end 
  
  def index
  	@companies = Company.all
  end
end
