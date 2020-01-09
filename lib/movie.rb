class Movie
    attr_reader :name, :runtime, :poster, :rating, :id
    def initialize(attributes)
        @name = attributes[:name]
        @runtime = attributes[:runtime].gsub(/[^0-9]/, '').to_i
        @poster = attributes[:poster]
        @rating = attributes[:rating]
        @id = attributes[:id].to_i
    end
    def save
        @id = DB.exec("INSERT INTO movies (name, runtime, poster, rating) VALUES ('#{@name}', '#{@runtime}', '#{@poster}', '#{@rating}') RETURNING id;").first.fetch('id').to_i
        self
    end
    def update(attributes)
        attributes = Movie.rehash(attributes)
        unless attributes[:name].nil?
            @name = attributes[:name]
            DB.exec("UPDATE movies SET name = '#{@name}' WHERE id = #{@id};")
        end
        unless attributes[:runtime].nil?
            @runtime = attributes[:runtime].gsub(/[^0-9]/, '').to_i
            DB.exec("UPDATE movies SET runtime = '#{@runtime}' WHERE id = #{@id};")
        end
        unless attributes[:poster].nil?
            @poster = attributes[:poster]
            DB.exec("UPDATE movies SET poster = '#{@poster}' WHERE id = #{@id};")
        end
        unless attributes[:rating].nil?
            @rating = attributes[:rating]
            DB.exec("UPDATE movies SET rating = '#{@rating}' WHERE id = #{@id};")
        end
    end
    def add_showing(theatre, time)
        DB.exec("INSERT INTO showings (theatre_id, movie_id, showtime) VALUES (#{theatre.id}, #{@id}, #{time});")
    end
    def ==(other)
        (@name == other.name) &&
        (@poster == other.poster) &&
        (@runtime == other.runtime) &&
        (@rating == other.rating) &&
        (@id == other.id)
    end

    #class methods
    def self.all
        DB.exec("SELECT * FROM movies;").map { |th| Movie.new(Movie.rehash(th)) }
    end
    def self.clear
        DB.exec("DELETE FROM movies *;")
    end
    def self.find(search)
        attributes = DB.exec("SELECT * FROM movies WHERE id = #{search};").first
        Movie.new(Movie.rehash(attributes))
    end

    private
    def self.rehash(hash)
        hash.reduce({}) do |acc, (key, val)|
            acc[key.to_sym] = (val == '') ? nil : val
            acc
        end
    end
end
