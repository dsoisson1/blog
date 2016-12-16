require 'page-object'
require 'yaml'

class AddComment
  include PageObject
  include DataMagic

  text_field(:name, :name => 'name')
  text_field(:textarea, :comment => 'comment')
  button(:submit, :id => 'submit')

  def populate_page
    populate_page_with data_for :add_comment
  end
end