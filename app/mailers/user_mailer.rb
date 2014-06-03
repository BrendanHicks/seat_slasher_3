class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject =>  "Welcome to My Awesome Site")
  end

  def available_ticket_alert(event, user)
    @event = event
    @user = user
    mail(:bcc => "brendan3015@gmail.com", :subject => "Testing 1,2,3" )
  end


end
