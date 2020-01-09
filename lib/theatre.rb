class Theatre
    attr_reader :name, :location, :img, :id
    def initialize(attributes)
        @name = attributes[:name]
        @img = attributes[:img]
        @location = attributes[:location]
        @id = attributes[:id].to_i
    end
    def save
        @id = DB.exec("INSERT INTO theatres (name, img, location) VALUES ('#{@name}', '#{@img}', '#{@location}') RETURNING id;").first.fetch('id').to_i
        self
    end
    def update(attributes)
        attributes = Theatre.rehash(attributes)
        unless attributes[:name].nil?
            @name = attributes[:name]
            DB.exec("UPDATE theatres SET name = '#{@name}' WHERE id = #{@id};")
        end
        unless attributes[:img].nil?
            @runtime = attributes[:img]
            DB.exec("UPDATE theatres SET img = '#{@img}' WHERE id = #{@id};")
        end
        unless attributes[:rating].nil?
            @rating = attributes[:location]
            DB.exec("UPDATE theatres SET location = '#{@location}' WHERE id = #{@id};")
        end
    end
    def add_showing(movie, time)
        DB.exec("INSERT INTO showings (theatre_id, movie_id, showtime) VALUES (#{@id}, #{movie.id}, #{time});")
    end
    def ==(other)
        (@name == other.name) &&
        (@location == other.location) &&
        (@img == other.img) &&
        (@id == other.id)
    end

    #class methods
    def self.all
        DB.exec("SELECT * FROM theatres;").map { |th| Theatre.new(Theatre.rehash(th)) }
    end
    def self.clear
        DB.exec("DELETE FROM theatres *;")
    end
    def self.find(search)
        attributes = DB.exec("SELECT * FROM theatres WHERE id = #{search};").first
        Theatre.new(Theatre.rehash(attributes))
    end

    private
    def self.rehash(hash)
        hash.reduce({}) do |acc, (key, val)|
            acc[key.to_sym] = (val == '') ? nil : val
            acc
        end
    end
end
