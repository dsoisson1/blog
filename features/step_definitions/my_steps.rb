require 'page-object'
require 'faker'

include PageObject::PageFactory
include Faker

When(/^I add a blog post$/) do
  visit_page(MainBlog)
  on MainBlog do |page|
    page.newBlog
  end
  on AddBlog do |page|
    page.author = Faker::Name.name
    page.title = 'Steelers will win the Super Bowl'
    page.textarea = Faker::Lorem.paragraph
    page.fulltext = Faker::Hipster.paragraphs(3)
    page.submit
  end
end

Then(/^it is added to the top of the list$/)do
  on_page(MainBlog) do |page|
    first_entry = page.first_blog_title
    expect(first_entry).to include 'Steelers will win the Super Bowl'
  end
end

When(/^I type in a duplicate post$/) do
  visit_page(MainBlog)
  on MainBlog do |page|
    page.newBlog
  end
  on AddBlog do |page|
    page.author = Faker::Name.name
    page.title = 'Steelers will win the Super Bowl'
    page.textarea = 'They are the best team in the NFL...unlike the Browns.'
    page.fulltext = Faker::Hipster.paragraphs(3)
    page.submit
  end
end

Then(/^I see an error page$/) do
  on ErrorPage do |page|
    expect(page.error_message).to eq 'Duplicate Entries Not Allowed'
  end
end

When(/^I visit the home page$/) do
  visit_page(MainBlog)
  on MainBlog do |page|
    page.newBlog
  end
  on AddBlog do |page|
    page.author = Faker::Name.name
    page.title = Faker::Hipster.sentence
    page.textarea = Faker::Hipster.paragraph
    page.fulltext = Faker::Hipster.paragraphs(3)
    page.submit
  end
end


Then(/^I see the latest ten posts$/) do
  on MainBlog do |page|
    expect(page.ten_total_posts).to be <= 10
  end
end

When(/I click on a post link$/) do
  visit_page(MainBlog)
  on MainBlog do |page|
    page.newBlog
  end
  on AddBlog do |page|
    page.author = Faker::Name.name
    page.title = Faker::Hipster.sentence
    page.textarea = Faker::Hipster.paragraph
    page.fulltext = Faker::Hipster.paragraphs(3)
    page.submit
  end
  visit_page(MainBlog)
  on MainBlog do |page|
    page.readBlog
  end
end


Then(/the entire article page is shown$/) do
  on BlogPost do |page|
    expect(page.one_post).to eq 1
  end
end

