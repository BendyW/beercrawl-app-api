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
    puts params
    puts '========================'
    user_name = params['user_name']
    # puts user_name
    # puts password
    puts '========================'
    @model = User.find_by(user_name: user_name)
    # binding.pry
    puts @model

    if @model

      puts  BCrypt::Password.new(@model.password_hash)
      @jim = BCrypt::Password.new(@model.password_hash)
      puts '-----------------------------------------'
      if @jim == params['password_hash']
        session[:logged] = true
        puts user_name
        session[:user_name] = user_name
        session.to_json
      end
    end
  end

  get '/' do
    User.all.to_json
  end

  post '/' do
    # @params = JSON.parse request.body.read
    puts '/---------------------/jdklfjlksdjfkldsjflk;dsjlkfsdj'
    puts params
    puts params["password_hash"].class
    puts params["password_hash"]
    jim = params["password_hash"]
    puts '--------------------------------------------'
    # password = params[:password]
    # salt = BCrypt::Engine.generate_salt
    # password_hash = BCrypt::Engine.hash_secret password, salt
    @password = BCrypt::Password.create(jim)
    puts @password
    puts '---------------------------'
    puts @password.class
    @user_name = params[:user_name]
    @email = params[:email]
    @model = User.new
    @model.user_name = @user_name
    @model.email = @email
    @model.password_hash = @password
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