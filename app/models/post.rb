class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1_000 }
  validates :rule_accepted, acceptance: true
  validates :presentation_category, presence: true
  validates :target_category, presence: true

  enum presentation_category: { lt: 0, proposal: 1, invitation: 2 }, _default: 0
  enum target_category: { beginner: 0, basic: 1, developer: 2 , alumni: 3 }, _default: 0
end
