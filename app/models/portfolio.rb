class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image
    has_many :technologies, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :technologies,
                                  reject_if: lambda { |attrs| attrs['name'].blank? },
                                  allow_destroy: true
    
    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    
    def self.recent
        order("created_at DESC")
    end
end
