class User < ActiveRecord::Base
  has_secure_password

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }
  validates :password,
    length: { minimum: 6}

  def self.authenticate_with_credentials(email, password)
    user = User.arel_table
    email_filtered = email.strip.prepend('%').concat('%')
    @user = User.where(user[:email].matches(email_filtered))[0]
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

end
