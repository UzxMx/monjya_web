class Api::TravelAgentsController < Api::BaseController
  def index
    @travel_agents = TravelAgent.all
  end
end