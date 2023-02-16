require_relative '../rails_helper'
RSpec.describe 'Recipe', type: :request do
  context 'should have status ok 200' do
    it 'index action should have status ok' do
      get '/users/1/recipes'
      expect(response).to have_http_status(:ok)
    end
    it 'show action should have status ok' do
      get '/users/1/recipes/1'
      expect(response).to have_http_status(:ok)
    end
  end
  context 'should render_template' do
    it 'index action should render index template' do
      get '/users/1/recipes'
      expect(response).to render_template('index')
    end
    it 'show action to render template show' do
      get '/users/1/recipes/1'
      expect(response).to render_template('show')
    end
  end
end
