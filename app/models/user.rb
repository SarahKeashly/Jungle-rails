class User < ActiveRecord::Base
  before_validation :downcase_email
  before_validation :whitespace_email
  has_secure_password
  validates :email, uniqueness: true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    end
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end


  def whitespace_email
    puts "hey"
    self.email = email.strip if email.present?
  end
end