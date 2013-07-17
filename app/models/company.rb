class Company < ActiveRecord::Base
  attr_accessible :desc, :fbid, :name, :url
  
  url_regex =/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
end
