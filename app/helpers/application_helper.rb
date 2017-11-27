module ApplicationHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size="\
"470x300&zoom=13&key=AIzaSyAlXu92qEJ9Eu-2s3VWG-fCPkDL2XHcSEE"
  end
end

