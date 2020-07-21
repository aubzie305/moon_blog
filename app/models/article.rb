class Article < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}
  # dependent: :destroy is used to avoid the foreign key constraint error
  # This allows for all comments tied to an article to be destroyed as the article is deleted
  has_many :comments, dependent: :destroy
end
