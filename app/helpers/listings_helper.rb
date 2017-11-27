module ListingsHelper
  def link_tags(tags)
    raw tags.map { |tag| link(tag.name) }.join(', ')
  end

  def link(tag)
    link_to tag, listings_path(:tag => tag)
  end

  def email_body(listing)
    "Hi,\n\nI am interested in your listing titled #{listing.title} on UNO Classifieds.\n\n"
  end

  def self.category_id(listing, context, param)
    cat_name = listing.category.name.titleize
    %(in the #{context.make_link(cat_name, param)} category ).html_safe
  end

  def self.tag(_, context, param)
    %(with tags like #{context.make_link(param.values.first, param)} ).html_safe
  end

  def self.user_id(listing, context, param)
    name = listing.user.name
    %(posted by #{context.make_link(name, param)} ).html_safe
  end

  def self.search(_, _, param)
    %( with text like #{param.values.first} )
  end

  def make_link(string = nil, param = {})
    %( #{link_to(string, listings_path(param))} ).html_safe
  end

  def index_welcome(params)
    filter_params = controller.send(:redirect_params, params)
    return 'No Listings found' if @listings.empty?
    return make_link('Listings').to_s if filter_params.empty?
    welcome = %(#{make_link('Listings')} ).html_safe
    filter_params.each do |key, value|
      welcome += ListingsHelper.public_send(key, @listings.first, self, key => value) if value.present?
    end
    welcome
  end
end

