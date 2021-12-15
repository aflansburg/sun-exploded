class ScenariosController < ApplicationController
  def new
    scenario = Scenario.new
    render json: { scenario: scenario.as_json.compact }, status: 200
  end

  def create
    scenario = Scenario.new(params[:scenario].as_json)
    scenario.save ? render(status: 200) : render(status: 400)
  end

  def index
    render json: { scenarios: Scenario.all }, status: 200
  end
end
