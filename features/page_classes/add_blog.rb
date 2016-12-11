require 'page-object'

class AddBlog
  include PageObject

  text_field(:author, :name => 'author')
  text_field(:title, :name => 'title')
  text_field(:textarea, :name => 'textarea')
  button(:submit, :id => 'submit')
end

