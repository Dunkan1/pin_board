class Pin < ActiveRecord::Base
    # include ActiveModel::Validations
    acts_as_votable
    belongs_to :user
    has_many :comments

    has_attached_file :image, styles: {medium: "300x300>"},
    :s3_protocol => "https",
    :s3_host_name => ENV["S3_HOST_NAME"],
    :path => ENV["S3_PATH"],
    :storage => "s3",
    :s3_region => ENV["AWS_REGION"]
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    validates :title, presence: true
    validates :title, uniqueness: true
end
