require 'page-object'
require 'yaml'

class AddBlog
  include PageObject
  include DataMagic

  text_field(:author, :name => 'author')
  text_field(:title, :name => 'title')
  text_field(:textarea, :name => 'textarea')
  text_field(:fulltext, :name => 'fulltext')
  button(:submit, :id => 'submit')

  def populate_page
    populate_page_with data_for :add_blog
  end
end

