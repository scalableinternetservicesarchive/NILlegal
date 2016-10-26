require 'rails_helper'

describe LandingPageController do
  render_views

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
      
      it 'current_user is accessible' do
        expect(controller.current_user).not_to be_nil
      end

      it 'displays a link to post a dare' do
        assert_select 'a[href=?]', new_dare_path
      end
    end

    context 'user not signed in' do
      it 'current_user is not accessible' do
        expect(controller.current_user).to be_nil
      end

      it 'displays a link to post a dare' do
        assert_select 'a[href=?]', new_user_registration_path
      end
    end
  end
end
