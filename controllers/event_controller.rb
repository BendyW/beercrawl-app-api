class EventController < ApplicationController
  get '/' do
    Event.all.to_json
  end
  get '/:id' do
    @id = params[:id]
    Event.find(@id).to_json
  end
  post '/' do
    @id = params[:id]
    @event_name = params[:event_name]
    @bar_crawl = params[:bar_crawl]
    @start_time = params[:start_time]
    @challenge_id = params[:challenge_id]
    @team_id = params[:team_id]
    # binding.pry
    @model = Event.new
    @model.event_name = @event_name
    @model.bar_crawl = @bar_crawl
    @model.start_time = @start_time
    @model.challenge_id = @challenge_id
    @model.team_id = @team_id
    @model.save
    @model.to_json
  end
  patch '/:id' do
    @model = Event.find(@id)
    @id = params[:id]
    @model.event_name = @event_name
    @model.bar_crawl = @bar_crawl
    @model.start_time = @start_time
    @model.challenge_id = @challenge_id
    @model.team_id = @team_id
    @model.save
    @model.to_json
  end
  delete '/:id' do
    @id = params[:id]
    @model = Event.find(@id)
    @model.destroy
    {:message => "Your account with an id: " + @id + " has been removed"}.to_json
  end
end