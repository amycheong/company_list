require 'json'
require 'net/http'
require 'rubygems'

class Company < ActiveRecord::Base
	before_save :validate_fbid

  	attr_accessible :desc, :fbid, :name, :url
  
  	url_regex = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ 


  	validates :name, 	:presence 	=> true
					 
  	validates :url,  	:presence 	=> true,
					:format 	=> { :with => url_regex },
					:uniqueness => { :case_sensitive => false }
  	validates :fbid, 	:presence 	=> true
  	validates :desc, 	:presence 	=> true
  	
  	
	def validate_fbid
  		uri = URI("http://graph.facebook.com/" + fbid)
  		data = Net::HTTP.get(uri)
  		name = JSON.parse(data)['name'] 
  	
  		if fbid.downcase != name.downcase
  			return false 
  		else
  			"#{name.downcase}"
  		end
  	end
end					 	