class Sub < ApplicationRecord
  validates :name, uniqueness: true
  validates :description, presence: true

  has_many :post_subs, inverse_of: :sub, dependent: :destroy
  has_many :posts, through: :post_subs, source: :post

  belongs_to :moderator
    class_name: :User,
    foreign_key: :moderator_id
    primary_key: :id,
    inverse_of: :subs
end
