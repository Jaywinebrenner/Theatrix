require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'create a movie path', {:type => :feature} do
    it 'creates a movie and then goes to the movie page' do
        visit('/movies')
        click_on('Add a new movie')
        fill_in('name', :with => 'Robocop')
        click_on('Go!')
        expect(page).to have_content('Robocop')
    end
end

describe 'create a song path', {:type => :feature} do
    it 'creates an movie and then goes to the movie page' do
        movie = Movie.new({name: "Platoon"}).save
        visit("/movies/#{movie.id}")
        fill_in('name', :with => 'All You Need Is Love')
        click_on('Add song')
        expect(page).to have_content('All You Need Is Love')
    end
end

describe 'create an movie path', {:type => :feature} do
    it 'creates an movie and then goes to the movie page' do
        visit('/movies')
        save_and_open_page
        click_on('Add a new movie')
        fill_in('name', :with => 'Yellow Submarine')
        click_on('Go!')
        expect(page).to have_content('Yellow Submarine')
    end
end
