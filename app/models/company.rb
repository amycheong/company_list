require 'json'
require 'net/http'
require 'rubygems'
require 'delayed_job'

class Company < ActiveRecord::Base
	before_save :validate_fbid
	
	
	scope :toplikes, order("likes desc").limit(20)

  	attr_accessible :desc, :fbid, :name, :url, :likes
  
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
  		fbname = JSON.parse(data)['username'] 
  		if fbname.nil?
  			fbname = JSON.parse(data)['name'] 
  		end 
  		
  		if !fbname.nil? && fbname.gsub(/\s+/, "").downcase =~ /#{name.downcase}/   			 			
  			return true 
  		else
  			return false
  		end
  	end
  	
  	def update_likes
  		uri = URI("http://graph.facebook.com/" + fbid)
  		data = Net::HTTP.get(uri)
  		update_attribute(:likes,JSON.parse(data)['likes']) 		
  	end
  	
  	def self.update_all_likes
  		$i = 0
  		while $i < Company.count do
  			company = Company.find($i+1)
  			uri = URI("http://graph.facebook.com/" +company.fbid)
  			data = Net::HTTP.get(uri)
  			company.update_attribute(:likes, JSON.parse(data)['likes'])
   			$i +=1
		end		
  	end
  	
  	handle_asynchronously :update_likes  	
end					 	