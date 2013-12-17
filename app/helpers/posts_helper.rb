module PostsHelper
  def show_tags(tags)
    content = content_tag('span')
    tags.collect do |tag|
        content << (link_to tag.name, "/tags/#{tag.id}", class: "radius secondary label tag-item")
    end
    content
    
  end
end
