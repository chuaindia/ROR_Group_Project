require_relative '../rails_helper'
RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'nodules', preparation_time: 2, cooking_time: 2, description: 'boil water and add your nodules',
               public: true, user_id: 1)
  end
  before { subject.save }
  context 'Should validate the association' do # rubocop: disable Metrics/BlockLength
    it 'Nil to not be valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'Name to be nodules' do
      expect(subject.name).to eq('nodules')
    end
    it 'Nil to not be valid' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'description to be boil water and add your nodules' do
      expect(subject.description).to eq('boil water and add your nodules')
    end
    it 'Nil to not be valid' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
    it 'preparation to be two hours' do
      expect(subject.preparation_time).to eq(2)
    end
    it 'Preparation above 400 to be not valid' do
      subject.preparation_time = 401
      expect(subject).to_not be_valid
    end
    it 'Nil to not be valid' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
    it 'cooking_time to be two hours' do
      expect(subject.cooking_time).to eq(2)
    end
    it 'cooking_time above 400 to be not valid' do
      subject.cooking_time = 401
      expect(subject).to_not be_valid
    end
  end
end
