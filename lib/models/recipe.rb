class Recipe

    attr_reader :name, :instructions, :duration

    @@all = []

    def initialize(name:, instructions:, duration:)
        @name = name
        @instructions = instructions
        @duration = duration
        @@all << self
    end

    def self.all
        @@all
    end

end