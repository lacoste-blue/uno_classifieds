module ListingsHelper
  def link_tags(tags)
    raw tags.map { |tag| link(tag.name) }.join(', ')
  end

  def link(tag)
    link_to tag, listings_path(:tag => tag)
  end

  def index_welcome(params)
    welcome = 'Listings %s %s %s'
    if params[:category_id]
      format(welcome, 'in the ', Category.find(params[:category_id]).name.titleize, ' category')
    elsif params[:tag]
      format(welcome, 'tagged with the ', params[:tag], ' tag')
    elsif params[:user_id]
      format(welcome, 'posted by ', User.find(params[:user_id]).name, '')
    else
      'All Listings'
    end
  end
end

