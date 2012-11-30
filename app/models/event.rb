class Event < ActiveRecord::Base
  attr_accessible :description, :title, :main_image

  #Paperclip
  has_attached_file :main_image, 
	:styles => { :smaill => "400x180#", :regular => "880x330#" }, 
	:preserve_files => true,
	:storage => :s3,
	:s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
end
