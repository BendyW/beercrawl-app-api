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
    @model.user_id = @user_id
    @model.points = @points
    @model.save
    @model.to_json
  end
  patch '/:id' do
    @model = Team.find(@id)
    @id = params[:id]
    @model.team_name = @team_name
    @model.user_id = @user_id
    @model.points = @points
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