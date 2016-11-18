class UserController < ApplicationController

  require 'bcrypt'

  get '/' do
    User.all.to_json
  end
  get '/:username' do
    @user_name = params[:username]
    if User.find(@user_name)
       session[:logged]
    end
  end

  post '/' do

    password = params[:password]
    salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret password, salt

    @user_name = params[:user_name]
    @email = params[:email]
    @model = User.new
    @model.user_name = @user_name
    @model.email = @email
    @model.password_hash = password_hash
    @model.save
    @model.to_json
  end
  patch '/:id' do
    @model = User.find(@id)
    @id = params[:id]
    @model.user_name = @user_name
    @model.email = @email
    @model.password_hash = @password_hash
    @model.save
    @model.to_json
  end
  delete '/:id' do
    @id = params[:id]
    @model = User.find(@id)
    @model.destroy
    {:message => "Your account with an id: " + @id + " has been removed"}.to_json
  end
end