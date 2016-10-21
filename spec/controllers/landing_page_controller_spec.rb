require 'rails_helper'

describe LandingPageController do
  describe 'GET index' do
    it 'returns 200 ok' do
      expect(:get => "/").to route_to(
        :controller => "landing_page",
        :action => "welcome"
      )
    end
  end
end
