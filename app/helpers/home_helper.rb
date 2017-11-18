module HomeHelper
  def recent_listings(limit)
    if Listing.has_picture.exists?
      Listing.has_picture.last(limit + 1)[1..-1]
    else
      'No pictures'
    end
  end

  def last_picture
    if Listing.has_picture.exists?
      last = Listing.has_picture.last
      link_to image_tag(last.pictures.first.image.url(:large)),
              listing_path(last), :target => '_blank', :class => 'd-block img-fluid'
    else
      'No pictures'
    end
  end
end

