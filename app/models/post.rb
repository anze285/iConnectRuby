class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :locations, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    accepts_nested_attributes_for :locations
end
