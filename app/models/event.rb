class Event < ActiveRecord::Base
  attr_accessible :description, :title, :main_image

  #Paperclip
  has_attached_file :main_image, 
	:styles => { :thumb => "100X100#", :small => "266X148#", 
	:large => "940X345#", :regular => "442X278#"}, 
	:preserve_files => true,
	:storage => :s3,
	:s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
end
