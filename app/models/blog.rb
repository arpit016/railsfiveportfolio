class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1}
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    validates_presence_of :title, :body
    
    belongs_to :user
    
    has_many :categorizations
    has_many :categories, through: :categorizations
    
    mount_uploader :thumb_image, BlogUploader
    mount_uploader :main_image, BlogUploader
end
