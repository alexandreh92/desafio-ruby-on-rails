require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #home' do
    before { get :home }
  end
end
