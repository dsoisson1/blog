require 'page-object'
require 'data_magic'

class MainBlog
  include PageObject
  include DataMagic

  page_url 'localhost:4567'

  button(:submit, :id => 'submit', :value => 'Add')


  def first_blog_title
    @browser.div(id: 'post-0', class: 'post').p.title
    blog = Blog.select(:id, :title, :date).find(1)

  end

end