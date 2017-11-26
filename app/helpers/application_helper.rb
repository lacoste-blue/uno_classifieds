module ApplicationHelper
  def google_map(center)
    URI.encode "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=470x300&zoom=13"
  end
end
