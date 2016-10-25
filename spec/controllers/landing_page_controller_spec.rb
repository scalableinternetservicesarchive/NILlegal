require 'rails_helper'

describe LandingPageController do
  describe 'GET index' do
    before do
      get :welcome
    end

    it 'routes to landing_page#welcome' do
      expect(:get => root_path).to route_to(
        :controller => "landing_page",
        :action => "welcome"
      )
    end

    it 'returns 200 OK' do
      assert_response :success
    end

    it 'renders correct view' do
      assert_template :welcome
    end

    context 'user signed in' do
      before do
        sign_in_user
        get :welcome
      end
      
      it 'displays post dare link' do
        assert_template :welcome
      end
    end

    context 'user not signed in' do
    end
  end
end
