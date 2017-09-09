class Book < ApplicationRecord
    validates :title, uniqueness: true
    has_attached_file :cover_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/prototype temp files/zombie_reading.jpg"
    validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/
end
