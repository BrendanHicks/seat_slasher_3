class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject =>  "Welcome to My Awesome Site")
  end

  def available_ticket_alert(event, user, subject)
    @event = event
    @users = user
    @subject = subject
    mail(:bcc => @users, :subject => subject )
  end


end
