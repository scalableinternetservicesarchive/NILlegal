require 'rails_helper'

describe DaresController do
  render_views

  describe 'GET new_dare' do
    context "logged in user" do
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
    context "not logged in" do
      it 'redirects to sign in' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end  
    end

  end

 
  describe 'POST new_dare' do
    context "valid user" do
      before do
        sign_in_user
        get :new
      end   
      
      context "with invalid attributes" do
        it "does not save the new post" do
          expect{
            post :create,
              params: { dare: FactoryGirl.attributes_for(:invalid_dare) }
          }.to_not change(Dare,:count)
        end
        
        it "re-renders the new method" do
          post :create,
            params: { dare: FactoryGirl.attributes_for(:invalid_dare) }
          expect(response).to render_template :new
          assert_select "div.alert", "The form contains 2 errors."
        end
      end
      
      
      context "with valid attributes" do
        it "saves the new post" do
          expect{
            post :create,
              params: { dare: FactoryGirl.attributes_for(:dare) }
          }.to change(Dare,:count).by(1)
        end
        
        it "renders the index method" do
          get :new
          post :create,
            params: { dare: FactoryGirl.attributes_for(:dare) }
          expect(response).to redirect_to show_dare_list_path
          assert_equal flash.empty?, false
          expect(flash[:success]).to match("Dare created!")
        end
      end
    end
    
    context "not logged in" do
      it 'redirects to sign in' do
        post :create,
          params: {dare: FactoryGirl.attributes_for(:dare)}
        expect(response).to redirect_to new_user_session_path
      end 
      it "post is not saved" do
        expect{
            post :create, 
              params: {dare: FactoryGirl.attributes_for(:dare)}
        }.to change(Dare,:count).by(0)
      end
    end
  
  
  end

  describe 'GET show_dare' do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @dare = FactoryGirl.create(:dare, user_id: @user.id)
    end

    it 'displays correct dare info' do
      get :show,
        params: { id: @dare.id }
      assert_select '#dare-title', @dare.title
      assert_select '#dare-description', @dare.description
    end

    context 'user signed in' do
      before do
        get :show,
          params: { id: @dare.id }
      end

      it 'shows comment form' do
        assert_select '#new_comment', count: 1
      end
    end

    context 'user not signed in' do
      before do
        sign_out @user
        get :show,
          params: { id: @dare.id }
      end

      it 'does not show comment form' do
        assert_select '#new_comment', count: 0
      end
    end
  end
  
  
  describe 'GET show_dare_list' do
    before do
      get :index
    end
    
    
    
    it 'routes to dares#index' do
        expect(:get => show_dare_list_path).to route_to(
          :controller => "dares",
          :action => "index"
        )
    end

    it 'returns 200 OK' do
      assert_response :success
    end

    it 'renders correct view' do
      assert_template :index
    end
    
    
    context 'With a dare saved' do
      before do
        @user = FactoryGirl.create(:user)
        @dare = FactoryGirl.create(:dare, user_id: @user.id)
        get :index
      end
      it 'displays the dare' do
        get :index
        assert_select 'a[href=?]', dare_path(@dare.id)
        #assert_select 'h3', "No Dares Posted Yet"
        #assert_select '#dare-description', @dare.description
      end
      
      it 'displays dare with valid search' do
        get :index,
          params: {search: "Test"}
        assert_select 'a[href=?]', dare_path(@dare.id)
        #assert_select 'h3', "No Dares Posted Yet"
        #assert_select '#dare-description', @dare.description
      end
      
      it 'displays no dares' do
        get :index,
          params: {search: "Nonexistent"}
        assert_select 'h3', "No Dares Posted Yet"
      end
      
    end
    
    context 'With no dares saved' do
      it 'displays no dares' do
        get :index
        assert_select 'h3', "No Dares Posted Yet"
      end
    end
    
   
    
    
    
  end
end
