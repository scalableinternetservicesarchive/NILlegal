require 'rails_helper'

describe Users::RegistrationsController do
  # This is only necessary for overriden devise controllers in test env
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  render_views

  describe 'GET users/:id' do
    let(:user) { FactoryGirl.create(:user) }

    context 'user not signed in' do
      before do
        get :show, { id: user.id }
      end

      it 'shows corresponding user profile page' do
        assert_select '#user-name', user.name
        assert_select '#user-email', user.email
      end

      it 'does not show edit profile or post dare buttons' do
        assert_select 'a[href=?]', edit_user_registration_path, count: 0
        assert_select 'a[href=?]', new_dare_path, count: 0
      end
    end

    context 'user is signed in' do
      before do
        sign_in user
      end

      context 'user visits their own profile page' do
        it 'redirects to their own profile page' do
          get :show, { id: user.id }
          expect(response).to redirect_to(current_user_profile_path)
        end
      end

      context "user visits someone else's profile page" do
        let(:another_user) { FactoryGirl.create(:another_user) }

        before do
          get :show, { id: another_user.id }
        end
        
        it 'shows corresponding user profile page' do
          assert_select '#user-name', another_user.name
          assert_select '#user-email', another_user.email
        end

        it 'does not show edit profile or post dare buttons' do
          assert_select 'a[href=?]', edit_user_registration_path, count: 0
          assert_select 'a[href=?]', new_dare_path, count: 0
        end
      end
    end
  end
end
