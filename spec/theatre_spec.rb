require 'spec_helper.rb'

describe 'Theatre' do
    describe '#==' do
        it 'compares for equality' do
            theatre1 = Theatre.new({name: 'Megaplex'})
            theatre2 = Theatre.new({name: 'Megaplex'})
            expect(theatre1 == theatre2).to eq(true)
        end
    end
    describe '#save' do
        it 'saves an theatre' do
            theatre = Theatre.new({name: 'Megaplex'}).save
            expect(Theatre.all).to include(theatre)
        end
    end
    describe '#update' do
        it 'updates an theatre by id' do
            theatre = Theatre.new({name: 'Megaplexx'}).save
            theatre.update({name: 'Megaplex'})
            expect(theatre.name).to eq('Megaplex')
        end
    end
    describe '.all' do
        it 'returns a list of all theatres' do
            expect(Theatre.all).to eq([])
        end
    end
    describe '.clear' do
        it 'clears all theatres' do
            Theatre.clear
            expect(Theatre.all).to eq([])
        end
    end
    describe '.find' do
        it 'finds a theatre by id' do
            theatre = Theatre.new({name: 'Megaplex'}).save
            expect(Theatre.find(theatre.id)).to eq(theatre)
        end
    end
end
