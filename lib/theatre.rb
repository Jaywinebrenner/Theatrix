class Theatre
    attr_reader :name, :location, :id
    def initialize(attributes)
        @name = attributes[:name]
        @location = attributes[:location]
        @id = attributes[:id].to_i
    end
    def save
        @id = DB.exec("INSERT INTO theatres (name, location) VALUES ('#{@name}', '#{@location}') RETURNING id;").first.fetch('id').to_i
        self
    end
    def update(attributes)
        attributes = Theatre.rehash(attributes)
        @name = attributes[:name] || @name
        @location = attributes[:location] || @location
        DB.exec("UPDATE theatres SET name = '#{@name}' WHERE id = #{@id};")
        DB.exec("UPDATE theatres SET location = '#{@location}' WHERE id = #{@id};")
    end
    def ==(other)
        (@name == other.name) && (@location == other.location) && (@id == other.id)
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
