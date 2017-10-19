class Picture < ApplicationRecord
  belongs_to :listing
  has_attached_file :image,
                    path: ":rails_root/public/images/:id/:filename",
                    url: "/images/:id/:filename",
                    :styles => {
                        :thumb => "50x50#",
                        :medium => "200x200" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
