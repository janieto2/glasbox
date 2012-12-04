class Event < ActiveRecord::Base
  attr_accessible :description, :title, :main_image, :date_time, :location

  #Paperclip
  has_attached_file :main_image, 
	:styles => { :small => "275x150#", :regular => "300x225#" }, 
	:preserve_files => true,
	:storage => :s3,
	:s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"
end
