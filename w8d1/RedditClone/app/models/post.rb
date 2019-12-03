class Post < ApplicationRecord
  validates :title, :url, :user_id, :sub_id, presence: true
  belongs_to :sub
end
