class RegistrationMailer < ActionMailer::Base
  default from: "registrations@movingteachings.com"

  def notify_registrant( dialectic, user )
    @dialectic = dialectic
    @user = user
    mail(:to => user.email, :subject => "Thanks for registering")
  end

  def notify_instructor( dialectic )
    @dialectic = dialectic
    @user = dialectic.user
    mail(:to => @user.email, :subject => "Someone registered for your class on MovingTeachings.com")
  end
end
