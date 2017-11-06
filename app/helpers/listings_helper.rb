module ListingsHelper

  def link_tags(tags)
      raw tags.map{ |tag| link(tag.name)}.join(', ')
  end

  def link(tag)
    link_to tag, listings_path(tag: tag)
  end

end
