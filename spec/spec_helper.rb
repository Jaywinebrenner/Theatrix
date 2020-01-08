require 'rspec'
require 'pg'
require 'movie'
require 'theatre'
require 'pry'

DB = PG.connect({:dbname => 'theatrix_test'})

RSpec.configure do |config|
    config.after(:each) do
        DB.exec "DELETE FROM theatres *;"
        DB.exec "DELETE FROM movies *;"
        DB.exec "DELETE FROM showings *;"
    end
end
