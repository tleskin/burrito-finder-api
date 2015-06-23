class Favorite < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  belongs_to :user
end
