require 'page-object'

class AddBlog
  include PageObject

  page_url 'localhost:4567'

  text_field(:author, :name => 'author')
  text_field(:title, :name => 'title')
  text_field(:text, :name => 'text')
  button(:submit, :id => 'submit', :value => 'Save')
end