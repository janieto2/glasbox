class Membership < ActiveRecord::Base
  attr_accessible :email, :user_id, :plan_id, :stripe_card_token
  attr_accessor	:stripe_card_token, :name, :address_line1, :address_zip
  
  before_save :update_stripe

  belongs_to :user

  validates_presence_of :plan_id
  validates_presence_of :email

  def update_stripe

    if stripe_customer_token.nil?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token, email: email, 
        name: name, address_line1: address_line1, address_zip: address_zip)
    else

      customer = Stripe::Customer.retrieve(stripe_customer_token)
      
      if stripe_card_token.present?
        customer.card = stripe_card_token
      end

      customer.plan = plan_id
      customer.email = email
      customer.save
    end

    self.stripe_customer_token = customer.id
    self.stripe_card_token = nil
  
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
