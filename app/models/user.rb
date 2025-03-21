class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true
  validates :x_id, format: { with: /\A[@][a-zA-Z0-9_]{1,15}\z/ }, allow_nil: true, uniqueness: true
  validates :social_portfolio_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_nil: true, uniqueness: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp }, allow_nil: true, uniqueness: true

  enum role: { general: 0, proposal: 1, invitation: 2 ,admin: 3 }, _default: 0
end
