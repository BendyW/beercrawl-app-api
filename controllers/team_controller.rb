class TeamController < ApplicationController
  get '/' do
    Team.all.to_json
  end
  get '/:id' do
    @id = params[:id]
    Team.find(@id).to_json
  end
  post '/' do
    @team_name = params[:team_name]
    @user_id = params[:user_id]
    @points = params[:points]
    @model = Team.new
    @model.team_name = @team_name
    @model.points = @points
    @model.save
    # find user, and give them this team's ID
    @user = User.find(@user_id)
    @user.team_id = @model.id
    @user.save
    #binding.pry
    @model.to_json
  end
  patch '/:id' do
    @id = params[:user_id]
    @user = User.find(@id)
    @model = Team.find(@user.team_id)
    @model.event_id = params[:event_id]
    # @id = params[:id]
    # @model.team_name = @team_name
    # @model.points = @points
    @model.save
    @model.to_json

  end
  delete '/:id' do
    @id = params[:id]
    @model = Team.find(@id)
    @model.destroy
    {:message => "Your account with an id: " + @id + " has been removed"}.to_json
  end
end