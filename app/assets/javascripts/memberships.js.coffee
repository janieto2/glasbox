# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
 membership.setupForm()

membership =
 setupForm: ->
   $('#new_membership').submit ->
     $('input[type=submit]').attr('disabled', true)
     if $('#card_number').length
       membership.processCard()
       false
     else
       true
 
 processCard: ->
   card =
     number: $('#card_number').val()
     name: $('#name').val()
     address_line1: $('#address_line1').val()
     address_zip: $('#address_zip').val()
     cvc: $('#card_code').val()
     expMonth: $('#card_month').val()
     expYear: $('#card_year').val()
   Stripe.createToken(card, membership.handleStripeResponse)
 
 handleStripeResponse: (status, response) ->
   if status == 200
     $('#membership_stripe_card_token').val(response.id)
     $('#new_membership')[0].submit()
   else
     $('#stripe_error').fadeIn()
     $('#stripe_error').text(response.error.message)
     $('input[type=submit]').attr('disabled', false) 