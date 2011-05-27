class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by_provider_and_uid(auth["provider"], auth["uid"])

    if user.name != auth["user_info"]["name"]
      user.name = auth["user_info"]["name"]
      user.save
    end

    return user
  end

  def to_s
    name
  end
end


















