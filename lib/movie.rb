class Movie
    attr_reader :name, :runtime, :rating, :id
    def initialize(attributes)
        @name = attributes[:name]
        @runtime = attributes[:runtime].to_i
        @rating = attributes[:rating]
        @id = attributes[:id].to_i
    end
    def save
        @id = DB.exec("INSERT INTO movies (name, runtime, rating) VALUES ('#{@name}', '#{@runtime}', '#{@rating}') RETURNING id;").first.fetch('id').to_i
        self
    end
    def update(attributes)
        attributes = Movie.rehash(attributes)
        unless attributes[:name].nil?
            @name = attributes[:name]
            DB.exec("UPDATE movies SET name = '#{@name}' WHERE id = #{@id};")
        end
        unless attributes[:runtime].nil?
            @runtime = attributes[:runtime]
            DB.exec("UPDATE movies SET runtime = '#{@runtime}' WHERE id = #{@id};")
        end
        unless attributes[:rating].nil?
            @rating = attributes[:rating]
            DB.exec("UPDATE movies SET rating = '#{@rating}' WHERE id = #{@id};")
        end
    end
    def ==(other)
        (@name == other.name) && (@runtime == other.runtime) && (@rating == other.rating) && (@id == other.id)
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
