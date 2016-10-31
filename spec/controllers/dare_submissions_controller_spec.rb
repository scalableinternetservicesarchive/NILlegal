require 'rails_helper'

RSpec.describe DareSubmissionsController, type: :controller do
  render_views
  
  describe 'GET new_dare_submission' do
    context "logged in user" do
      before do
        sign_in_user
        dare = FactoryGirl.create(:dare)
        dare.save
        get :new, 
          params: {dare_submission: {dare_id: dare.id}}
      end
  
      # it 'routes to dares#create' do
      #   expect(:get => new_dare_submission).to route_to(
      #     :controller => "dare_submissions",
      #     :action => "new"
      #   )
      # end
  
      it 'returns 200 OK' do
        assert_response :success
      end
  
      it 'renders correct view' do
        assert_template :new
      end
    end  
  context "invalid dare id" do
    before do
      sign_in_user
    end
    it "redirects to show_dare_list_path when id for dare doesn't exist" do
      get :new, 
        params: {dare_submission: {dare_id: 9}}
      expect(response).to redirect_to show_dare_list_path
      assert_equal flash.empty?, false
      expect(flash[:danger]).to match("Cannot Submit to Nonexistent Dare")
    end
    
  end
    
    context "not logged in" do
      before do
        
      end
      
      it 'redirects to sign in' do
        dare = FactoryGirl.create(:dare)
        get :new, 
          params: {dare_submission: {dare_id: dare.id}}
        expect(response).to redirect_to new_user_session_path
      end  
    end

  end

end
