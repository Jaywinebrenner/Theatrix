require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'create a theatre path', {:type => :feature} do
    it 'creates a theatre and then navigates to the theatre page' do
        visit('/')
        click_on('Search Theatres')
        click_on('here')
        fill_in('name', :with => 'Robocop')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'Poster')
        fill_in('rating', :with => 'R')
        click_on('Add Theatre')
        expect(page).to have_content('Robocop')
    end
end

describe 'create a theatre path', {:type => :feature} do
    it 'updates a theatre' do
        Theatre.new({name: "Platoon", runtime: '100', rating: 'R'}).save
        visit('/')
        click_on('Search Theatres')
        click_on('Platoon')
        click_on('Edit Theatre')
        fill_in('name', :with => 'Platoon')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'poster')
        fill_in('rating', :with => 'R')
        click_on('Go!')
        expect(page).to have_content('Platoon')
    end
end

describe 'create a theatre path', {:type => :feature} do
    it 'deletes a theatre' do
        Theatre.new({name: "Platoon", runtime: '100', rating: 'R'}).save
        visit('/')
        click_on('Search Theatres')
        click_on('Platoon')
        click_on('Edit Theatre')
        fill_in('name', :with => 'Platoon')
        fill_in('runtime', :with => '100')
        fill_in('poster', :with => 'poster')
        fill_in('rating', :with => 'R')
        click_on('Delete')
        expect(page).not_to have_content('Platoon')
    end
end
