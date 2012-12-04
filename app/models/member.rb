class Member < ActiveRecord::Base
  attr_accessible :description, :name, :main_image

#Paperclip
  has_attached_file :main_image, 
	:styles => { :small => "200x150#", :regular => "380x175#", :large => "880x330#"}, 
	:preserve_files => true,
	:storage => :s3,
	:s3_credentials => "#{::Rails.root.to_s}/config/s3.yml"

end
