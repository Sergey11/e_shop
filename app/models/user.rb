class User < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 }
  
  validates :password, length: { minimum: 1 }

  has_secure_password
  acts_as_messageable
  
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    
end
