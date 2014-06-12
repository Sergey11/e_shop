class Token < ActiveRecord::Base

  belongs_to :user

  def self.generate_token (user)
    token = SecureRandom.urlsafe_base64
    create(token: token, user: user)

  end

  def self.analyse(token)
   item = find_by(token: token)
   if !item.nil?
    user = item
  else
    user = false
  end
end

end
