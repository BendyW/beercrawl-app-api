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
        session[:team_id] = @model.team_id
        session.to_json
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

    @test = User.find_by(user_name: params[:user_name])
    @test2 = User.find_by(email: params[:email])
    if @test || @test2
    else
      parampass = params["password_hash"]
      @password_hash = BCrypt::Password.create(parampass)

      @user_name = params[:user_name]
      @email = params[:email]
      @model = User.new
      @model.user_name = @user_name
      @model.email = @email
      @model.password_hash = @password_hash
      @model.save
      session[:logged] = true
      session[:user_name] = @user_name
      session[:user_id] = @model.id

      @model.to_json
    end

  end

  patch '/:id' do
    @model = User.find(params[:id])
    @model.team_id = params[:team_id]
    @model.save
    @session[:team_id] = @model.team_id
    # @id = params[:id]
    # @model.user_name = @user_name
    # @model.email = @email
    # @model.password_hash = @password_hash
    # @model.save
    # @model.to_json
  end

  delete '/:id' do
    @id = params[:id]
    @model = User.find(@id)
    @model.destroy
    {:message => "Your account with an id: " + @id + " has been removed"}.to_json
  end
