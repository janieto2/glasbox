class User < ActiveRecord::Base
  #Attributes
  attr_accessible :email, :first_name, :last_name, 
  				  :password, :password_confirmation, :is_admin

  	has_one :membership

	#Authlogic
	acts_as_authentic do |c|
		c.login_field = :email
	end

	#Defs
	def full_name
	  "#{first_name} #{last_name}"
	end 

	def stripe_customer
		Stripe::Customer.retrieve(self.membership.stripe_customer_token)
	end

	def membership_type
		if membership.plan_id == 1
			"Friend"
		elsif membership.plan_id == 2
			"Gold"
		else
			"Free"
		end
	end

end
