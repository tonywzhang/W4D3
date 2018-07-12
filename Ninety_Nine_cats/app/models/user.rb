class User < ApplicationRecord
  attr_reader :password
  
  validates :name, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(name: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
  
  before_validation :ensure_session_token
end