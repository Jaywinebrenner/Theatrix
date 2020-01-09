require 'spec_helper.rb'

describe 'Movie' do
    describe '#==' do
        it 'compares for equality' do
            movie1 = Movie.new({name: 'BlindSpotting', rating: 'R', runtime: '96'})
            movie2 = Movie.new({name: 'BlindSpotting', rating: 'R', runtime: '96'})
            expect(movie1 == movie2).to eq(true)
        end
    end
    describe '#save' do
        it 'saves a movie' do
            movie = Movie.new({name: 'BlindSpotting', rating: 'R', runtime: '96'}).save
            expect(Movie.all).to include(movie)
        end
    end
    describe '#update' do
        it 'updates an movie by id' do
            movie = Movie.new({name: 'blind potting'}).save
            movie.update({name: 'Blindspotting'})
            expect(movie.name).to eq('Blindspotting')
        end
    end
    describe '.all' do
        it 'returns a list of all movies' do
            expect(Movie.all).to eq([])
        end
    end
    describe '.clear' do
        it 'clears all movies' do
            Movie.clear
            expect(Movie.all).to eq([])
        end
    end
    describe '.find' do
        it 'finds a movie by id' do
            movie = Movie.new({name: 'Blindspotting'}).save
            expect(Movie.find(movie.id)).to eq(movie)
        end
    end
end
