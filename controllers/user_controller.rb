class UserController < ApplicationController
  get '/' do
    User.all.to_json
  end
  get '/:id' do
    @id = params[:id]
    User.find(@id).to_json
  end
  post '/' do

    @id = params[:id]
    @user_name = params[:user_name]
    @email = params[:email]
    @password_hash = params[:password_hash]
    @model = User.new
    @model.user_name = @user_name
    @model.email = @email
    @model.password_hash = @password_hash
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