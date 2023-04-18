require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'when I visit the dishes show page' do
    before(:each) do
      dummy_data
   end

    it 'displays the name and description of dish' do
      visit "/dishes/#{@dish_1.id}"

      within ('#dish-info') do

        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to_not have_content(@dish_2.name)
      end
    end

    it 'displays a list of ingredients for the dish' do
      visit "/dishes/#{@dish_1.id}"

      within ('#dish_ingredients') do

        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end

    it 'diplays a total calorie count for the dish' do
      visit "/dishes/#{@dish_1.id}"

      within ('#dish-info') do

        expect(page).to have_content(@dish_1.total_calories)
      end
    end

    it 'displays the chefs name' do
      visit "/dishes/#{@dish_1.id}"

      within ('#dish-info') do

        expect(page).to have_content(@chef_1.name)
      end
    end
  end
end