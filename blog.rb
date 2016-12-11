require 'sinatra'
require_relative 'lib/blog_entry'
blogEntry = BlogEntry.new

get '/' do
  # blogs = blogEntry.get_blogs
  haml :index, :format => :html5
end

post '/blog' do
  blogEntry.add_blog params[:author] , params[:title] , params[:text]
  blogs = blogEntry.get_blogs
  haml :index, :locals => {:all_blogs => blogs}
end



