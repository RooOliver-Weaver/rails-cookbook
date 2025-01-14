class Category < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipes, through: :bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true
end
