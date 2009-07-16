$:.unshift(File.join(File.dirname(__FILE__),'lib'))
require 'rubygems'
require 'sinatra'
require 'pwdgen'

# new
get '/' do
  erb :new
end

# create
post '/' do
	num = params[:pwnum].to_i
	len = params[:pwlen].to_i
  @pwlist = PWDGen.new(num, len)
  if @pwlist
    erb :show
  else
    redirect '/'
  end
end

# show
get '/:num/:len/' do
	num = params[:num].to_i ||= 1
	len = params[:len].to_i ||= 8
  @pwlist = PWDGen.new(num, len)
  if @pwlist
    erb :show
  else
    redirect '/'
  end
end
