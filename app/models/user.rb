class User < ActiveRecord::Base
  has_secure_password

  has_many :password_resets
  has_many :loan_offers

  before_create { generate_token(:auth_token) }

  validates_uniqueness_of :email
  validates_presence_of :password_digest, on: :create
  # validate format of password

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    AppMailer.password_reset(self).deliver_now
  end
end
