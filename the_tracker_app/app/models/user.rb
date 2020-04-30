class User < ApplicationRecord
  
  validates :password, length: {minimum: 6, allow_nil: true}
  validate :session_token
  validates :password_digest, presence: true
  

  attr_reader :password
  
  has_many :goals,
    foreign_key: :goal_id,
    class_name: :Goal

  has_many :comments,
    foreign_key: :comment_id,
    class_name: :Comment
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil 
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token

  end

  def password=(password)
    

  end

  def ensure_session_token

  end

  def reset_session_token!

  end

end
