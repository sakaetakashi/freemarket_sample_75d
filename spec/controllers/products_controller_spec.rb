require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'GET #search' do
    it 'search.html.hamlに遷移すること' do
      get :search
      expect(response).to render_template :search
    end
  end
end