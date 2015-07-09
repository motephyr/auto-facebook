# -*- encoding : utf-8 -*-
class User
  module OmniauthCallbacks

    ["facebook"].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        uid = response["uid"]
        data = response["info"]

        credentials= response['credentials']

        if user = User.where( :fb_id => uid).first
        elsif user = User.find_by_email(data["email"])
          user.update_attribute(:fb_id ,uid )
        else
          user = User.new_from_provider_data(provider,uid,data, credentials)
        end
        return user
      end
    end


    def new_from_provider_data(provider, uid, data,credentials)
      user = User.new
      user.email = data["email"]
      user.token = credentials['token']
      user.name = data["nickname"] ? data ["nickname"] : data["name"]
      user.remote_avatar_url = data["image"]
      user.fb_id = uid

      user.name.gsub!(/[^\w]/, "_")
      if User.where(:name => user.name).count > 0 || user.name.blank?
        user.name = "u#{Time.now.to_i}"
      end

      return user
    end
  end
end
