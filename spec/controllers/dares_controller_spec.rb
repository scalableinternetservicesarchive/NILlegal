require 'rails_helper'

describe DaresController do
  render_views

  describe 'GET new_dare' do
    before do
      sign_in_user
      get :new
    end

    it 'routes to dares#create' do
      expect(:get => new_dare_path).to route_to(
        :controller => "dares",
        :action => "new"
      )
    end

    it 'returns 200 OK' do
      assert_response :success
    end

    it 'renders correct view' do
      assert_template :new
    end
  end  

 
  describe 'POST new_dare' do
    before do
      sign_in_user
      get :new
    end    
    
    context "with invalid attributes" do
      it "does not save the new post" do
        expect{
          post :create, dare: FactoryGirl.attributes_for(:invalid_dare)
        }.to_not change(Dare,:count)
      end
      
      it "re-renders the new method" do
        post :create, dare: FactoryGirl.attributes_for(:invalid_dare)
        response.should render_template :new
        assert_select "div.alert", "The form contains 2 errors."
      end
    end
    
    
    context "with valid attributes" do
      it "saves the new post" do
        expect{
          post :create, dare: FactoryGirl.attributes_for(:dare)
        }.to change(Dare,:count).by(1)
      end
      
      it "renders the index method" do
        get :new
        post :create, dare: FactoryGirl.attributes_for(:dare)
        response.should redirect_to show_dare_list_path
        assert_equal flash.empty?, false
        expect(flash[:success]).to match("Dare created!")
      end
    end
  
  end
end
