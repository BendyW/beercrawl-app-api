class ApplicationController < Sinatra::Base

  @username = ''

  require 'bundler'
  Bundler.require

  register Sinatra::CrossOrigin


  ActiveRecord::Base.establish_connection(
      :adapter => 'mysql2',
      :database=> 'beercrawl'
  )

  require 'sinatra'
  require 'sinatra/cross_origin'

  enable :sessions

  set :allow_origin, :any
  set :allow_methods, [:get, :post, :patch, :delete]

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  configure do
    enable :cross_origin
  end

  # before '/*' do
  #   if session[:logged] == nil
  #
  #     session[:warning] = "not logged"
  #     redirect('/api/users/login')
  #
  #   end
  # end

end