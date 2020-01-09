require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'create a movie path', {:type => :feature} do
    it 'creates a movie and then goes to the movie page' do
        visit('/')
        click_on('Search Movies')
        click_on('here')
        fill_in('name', :with => 'Robocop')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'Poster')
        fill_in('rating', :with => 'R')
        click_on('Add Movie')
        expect(page).to have_content('Robocop')
    end
end

describe 'create a movie path', {:type => :feature} do
    it 'updates a movie' do
        Movie.new({name: "Platoon", runtime: '100', rating: 'R'}).save
        visit('/')
        click_on('Search Movies')
        click_on('Platoon')
        click_on('Edit Movie')
        fill_in('name', :with => 'Platoon')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'poster')
        fill_in('rating', :with => 'R')
        click_on('Go!')
        expect(page).to have_content('Platoon')
    end
end

describe 'create a movie path', {:type => :feature} do
    it 'updates a movie' do
        Movie.new({name: "Platoon", runtime: '100', rating: 'R'}).save
        visit('/')
        click_on('Search Movies')
        click_on('Platoon')
        click_on('Edit Movie')
        fill_in('name', :with => 'Platoon')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'poster')
        fill_in('rating', :with => 'R')
        click_on('Delete')
        expect(page).not_to have_content('Platoon')
    end
end

# describe 'create an movie path', {:type => :feature} do
#     it 'creates an movie and then goes to the movie page' do
#         visit('/movies')
#         save_and_open_page
#         click_on('Add a new movie')
#         fill_in('name', :with => 'Yellow Submarine')
#         click_on('Go!')
#         expect(page).to have_content('Yellow Submarine')
#     end
# end
