class Tweet < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations, dependent: :destroy

end
