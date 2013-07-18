class Company < ActiveRecord::Base
  attr_accessible :desc, :fbid, :name, :url
  
  url_regex = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ 


  validates :name, 	:presence 	=> true
					 
  validates :url,  	:presence 	=> true,
					:format 	=> { :with => url_regex },
					:uniqueness => { :case_sensitive => false }
  validates :fbid, 	:presence 	=> true
  validates :desc, 	:presence 	=> true

end					 	