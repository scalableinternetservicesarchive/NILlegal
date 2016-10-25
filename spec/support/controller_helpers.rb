require 'rails_helper'

module ControllerHelpers
  def sign_in_user
    user = FactoryGirl.create(:user)
    sign_in user # method from devise:TestHelpers
  end
end
