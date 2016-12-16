require 'page-object'


class BlogPost
  include PageObject
  include DataMagic


  text_field(:author, :name => 'author')
  text_field(:title, :name => 'title')
  text_field(:textarea, :name => 'textarea')
  text_field(:fulltext, :name => 'fulltext')


  def one_post
    @browser.elements(:class => 'post').size
  end

end
