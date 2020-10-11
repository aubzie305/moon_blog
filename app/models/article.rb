class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: {minimum: 5, maximum: 90}
  validates :body, presence: true, length: {minimum: 5}
  # dependent: :destroy is used to avoid the foreign key constraint error
  # This allows for all comments tied to an article to be destroyed as the article is deleted
end
