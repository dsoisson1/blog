require 'page-object'

class ErrorPage
  include PageObject

  page_url 'localhost:4567/errorPage'


  def error_message
    @browser.h2.text
  end

end
