class Notification < ActiveRecord::Base

  enum message: [:password, :loan_amount]

  def notify_password
    "#{self.user} has changed his/her password more than three times in the last 24 hours"
  end

  def notify_amount
    "#{self.user} has changed the requested loan amount more than three times in the last week"
  end

end


