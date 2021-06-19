class Hashtag < ApplicationRecord
    has_many :pics, through: :hashtags_pics 
end
