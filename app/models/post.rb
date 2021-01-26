class Post < ApplicationRecord
    belongs_to :user
    has_many :locations, dependent: :destroy
    has_many :likes, dependent: :destroy

    accepts_nested_attributes_for :locations
end
