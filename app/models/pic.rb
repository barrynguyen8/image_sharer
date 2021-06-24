class Pic < ApplicationRecord
    
    scope :today, -> { where("DATE(created_at) = ?", Date.today) }
    acts_as_votable
    belongs_to :user #associations
    has_many :hashtags, through: :hashtags_pics 
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
end
