class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image
    has_many :technologies, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :technologies,
                                  reject_if: lambda { |attrs| attrs['name'].blank? },
                                  allow_destroy: true
    
    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    
    after_initialize :set_defaults
    
    def set_defaults
       self.main_image ||= "http://via.placeholder.com/600x400"
       self.thumb_image ||= "http://via.placeholder.com/350x200"
    end
end
