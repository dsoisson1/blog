class BlogEntry
  attr_reader :blogs

  def initialize
    @blogs = Array.new
  end

  def add_blog author, title, text

    blog_entry = {
        author: author,
        title: title,
        textarea: text
    }

    @blogs.push blog_entry
  end

  def get_blogs
    return @blogs
  end

end


