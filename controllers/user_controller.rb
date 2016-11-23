class UserController < ApplicationController

  require 'bcrypt'

  get '/:id' do
    @id = params[:id]
    @model = User.find(@id)
    @model.to_json
  end

  post '/login' do
    @params = JSON.parse request.body.read
    password = params['password_hash']
    user_name = params['user_name']
    @model = User.find_by(user_name: user_name)
    if @model
      if BCrypt::Password.new(@model.password_hash) == password
        session[:logged] = true
        puts user_name
        session[:user_name] = user_name
        session[:user_id] = @model.id
        session.to_json
        p '-@_@_@_@_@_@_@_@_@_@-'
        p session.to_json
      else
        session[:logged] = false
        p session.to_json
      end
    else
      session[:logged] = false
      p session.to_json
    end
  end


  get '/' do
    User.all.to_json
  end

  post '/' do
    @params = JSON.parse request.body.read
    user_name = params['user_name']
    email = params['email']
    @test = User.find_by(user_name: user_name)
    @test2 = User.find_by(email: email)
    if @test || @test2
    else
      parampass = params['password_hash']
      password_hash = BCrypt::Password.create(parampass)
      # binding.pry
      puts user_name
      puts email
      puts password_hash
      @model = User.new
      @model.user_name = user_name
      @model.email = email
      @model.password_hash = password_hash
      @model.save
      session[:logged] = true
      session[:user_name] = @user_name
      session[:user_id] = @model.id
      session.to_json
      p '__!_!_!_!_!_!_!_!_!_!_!_!_!__'
      p session.to_json
      @model.to_json
    end
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