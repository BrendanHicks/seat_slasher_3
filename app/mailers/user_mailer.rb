class UserMailer < ActionMailer::Base
  default from: "seatslasher@gmail.com"

  def welcome_email(user)
    @user = User.find(current_user.id)
    @url ='http://google.com/'
    mail(to: @user.email, subject: 'Welcome to Seat Slasher')
  end

  def available_ticket_alert(user)
    @user = 'brendan3015@gmail.com'
    @url = 'http://google.com/'
    mail(to: @user, subject: "New Tickets Available on Seat Slasher")
  end

end
