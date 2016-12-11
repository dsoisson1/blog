require 'page-object'

include PageObject::PageFactory

When(/^I add a blog post$/) do
  visit_page(MainBlog)
  on MainBlog do |page|
    page.newBlog
  end
  on (AddBlog) do |page|
    page.author = 'duane soisson'
    page.title = 'Steelers will win the Super Bowl'
    page.textarea = 'They are the best team in the NFL...unlike the Browns.'
    page.save
  end
end

Then(/^it is added to the top of the list$/)do
  on_page(MainBlog) do |page|
    first_entry = page.first_blog_title
    expect(first_entry).to include 'Steelers will win the Super Bowl'
  end
end



