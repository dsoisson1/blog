require 'page-object'
# require 'data_magic'

class MainBlog
  include PageObject
  # include DataMagic

  page_url 'localhost:4567'

  button(:newBlog, id: 'newBlog')
  button(:readBlog, id: 'readBlog')


  def first_blog_title
    @browser.div(id: 'post-0').text
  end


  def ten_total_posts
    @browser.elements(:class => 'post').size
  end


end


