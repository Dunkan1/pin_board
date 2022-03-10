class Pin < ActiveRecord::Base
    # include ActiveModel::Validations
    acts_as_votable
    belongs_to :user
    has_many :comments

    has_attached_file :image, styles: {medium: "300x300>"}
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates :title, presence: true

    # validates :title, comparison: { other_than: "user"}
    validates :title, uniqueness: true
end
