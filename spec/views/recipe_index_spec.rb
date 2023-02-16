require_relative '../rails_helper'
RSpec.describe 'recipe', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(name: 'peter')
    @recipe = Recipe.create(name: 'nodules', preparation_time: 2, cooking_time: 2,
                            description: 'boil water and add your nodules', public: true, user_id: @user.id)
  end
  context 'should render index page accordingly' do
    it 'have the required content' do
      visit "/users/#{@user.id}/recipes/"
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.description)
      expect(page).to have_button('Remove')
    end
  end
end
