class Picture < ApplicationRecord
  belongs_to :listing
  has_attached_file :image,
                    :path => ':rails_root/public/images/:id/:filename',
                    :url => '/images/:id/:filename',
                    :styles => {
                      :thumb => '50x50',
                      :medium => '200x200',
                      :big => '600x400#',
                      :large => '900x350#'
                    }

  validates_attachment_content_type :image, :content_type => %w[image/jpg image/jpeg image/png]

  def self.no_image
    # @no_img = Picture.new(:image => ActionDispatch::Http::UploadedFile.new(:tempfile => File.new(Rails.root.join('app', 'assets', 'images', 'no-image.jpg'))))
    @no_img ||= Picture.create(:image => File.open(Rails.root.join('app', 'assets', 'images', 'no-image.jpg')))
  end
end

