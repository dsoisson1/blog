require 'page-object'

include PageObject::PageFactory

When(/^I add a blog post$/) do
  visit_page(MainBlog) do |page|
    page.submit
  end
  on_page(AddBlog) do |page|
    page.author = 'duane soisson'
    page.title = 'Steelers will win the Super Bowl'
    page.text = 'They are the best team in the NFL...unlike the Browns.'
    page.submit
  end
end

Then(/^it is added to the top of the list$/)do
  on_page(MainBlog) do |page|
    title = page.first_blog_title
    expect(title).to eq 'Steelers will win the Super Bowl'
  end
end


