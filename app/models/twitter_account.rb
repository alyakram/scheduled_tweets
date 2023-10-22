class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: true

  def client
    require "x"

    x_credentials = {
      api_key:             Rails.application.credentials.dig(:twitter, :api_key),
      api_key_secret:      Rails.application.credentials.dig(:twitter, :api_secret),
      access_token:        token,
      access_token_secret: secret,
    }

    client = X::Client.new(**x_credentials)
  end
end