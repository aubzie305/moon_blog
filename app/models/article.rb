class Article < ApplicationRecord
  # dependent: :destroy is used to avoid the foreign key constraint error
  # This allows for all comments tied to an article to be destroyed as the article is deleted
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
end
