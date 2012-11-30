class User < ActiveRecord::Base
  #Attributes
  attr_accessible :email, :first_name, :last_name, 
  				  :password, :password_confirmation, :is_admin

	#Authlogic
	acts_as_authentic do |c|
		c.login_field = :email
	end

	#Defs
	def full_name
	  "#{first_name} #{last_name}"
	end 

end
