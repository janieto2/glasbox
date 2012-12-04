class NotificationsMailer < ActionMailer::Base
  default :from => "noreply@glasbox.com"
   default :to => "robert@bstelpaso.com"

    def new_message(message)
      @message = message
      mail(:subject => "Glasbox Site: #{message.subject}")
    end
end
