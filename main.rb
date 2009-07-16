$:.unshift(File.join(File.dirname(__FILE__),'lib'))
require 'rubygems'
require 'sinatra'
require 'pwdgen'

# new
get '/' do
  erb :new
end

# generate pw
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

# show /number-[d]/length-[d]/
get %r{/number-(\d+)/length-(\d+)/}  do
	num = params[:captures][0].to_i
	len = params[:captures][1].to_i
  @pwlist = PWDGen.new(num, len)
  if @pwlist
    erb :show
  else
    redirect '/'
  end
end
