class ChallengeController < ApplicationController
  get '/' do
    Challenge.all.to_json
  end
  get '/:id' do
    @id = params[:id]
    Challenge.find(@id).to_json
  end
  post '/' do

    @id = params[:id]
    @challenge_name = params[:challenge_name]
    @difficulty = params[:difficulty]
    @point_value = params[:point_value]
    @picture = params[:picture]
    @model = Challenge.new
    @model.challenge_name = @challenge_name
    @model.difficulty = @difficulty
    @model.point_value = @point_value
    @model.picture = @picture
    @model.save
    @model.to_json
  end
  patch '/:id' do
    @model = Challenge.find(@id)
    @id = params[:id]
    @model.challenge_name = @challenge_name
    @model.difficulty = @difficulty
    @model.point_value = @point_value
    @model.picture = @picture
    @model.save
    @model.to_json
  end
  delete '/:id' do
    @id = params[:id]
    @model = Challenge.find(@id)
    @model.destroy
    {:message => "Your account with an id: " + @id + " has been removed"}.to_json
  end
end