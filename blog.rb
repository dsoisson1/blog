require 'sinatra'
require_relative 'lib/blog_entry'

# blogEntry = BlogEntry.new

blogEntry = Array.new

blogComment = Array.new


get '/' do
  haml :index, :format => :html5, :locals => {:blogEntry => blogEntry}
end

get '/new_blog' do
  haml :addBlog
end

post '/add_blog' do
  # blogEntry = BlogEntry.new

  # blogEntry.add_blog params[:author], params[:title], params[:textarea]
  # blogs = blogEntry.get_blogs
  # haml :index, :locals => {:blogEntry => blogs}

  p = BlogEntry.new
  p.author = params[:author]
  p.title = params[:title]
  p.textarea = params[:textarea]
  p.fulltext = params[:fulltext]
  # if duplicate
  # then haml error page
  # else
  x = blogEntry.find do |entry|
    entry.title == p.title
  end

  if x != nil
    haml :errorPage
  else
    blogEntry.unshift(p)
    haml :index, :locals => {:blogEntry => blogEntry}
  end
end

get '/readBlog' do
  index = params[:i].to_i
  haml :readBlog, :locals => {:the_entry => blogEntry[index]}
end

get '/errorPage' do
  haml :errorPage
end

