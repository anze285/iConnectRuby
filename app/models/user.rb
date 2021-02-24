class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      Rails.logger.debug(provider_data)
      if provider_data.info.provider == "facebook"
        user.fullname = provider_data.info.first_name + " " + provider_data.info.last_name
        user.username = provider_data.info.first_name
        user.picture = provider_data.info.image
      else
        user.fullname = provider_data.info.name
        user.username = provider_data.info.first_name
        user.picture = provider_data.info.picture
      end
      
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, dependent: :destroy
end
