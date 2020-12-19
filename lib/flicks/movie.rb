require_relative 'rankable'

class Movie
    include Rankable
    attr_accessor :rank
    attr_accessor :title

    def initialize(title,rank=0)
        @title = title.capitalize
        @rank = rank
        @snack_carbs = Hash.new(0)
    end

    def self.from_csv(line)
        title, rank = line.split(',')
        Movie.new(title, Integer(rank))
    end

    def to_csv
        "#{@title},#{@rank}"
    end

    def carbs_consumed 
        @snack_carbs.values.reduce(0,:+)
    end

    def each_snack
        @snack_carbs.each do |name, carbs|
            snack = Snack.new(name, carbs)
            yield snack
        end
    end

    def ate_snack(snack)
        @snack_carbs[snack.name] += snack.carbs
        puts "#{@title} led to #{snack.carbs} #{snack.name} being consumed."
        puts "#{@title}'s snacks: #{@snack_carbs}"
    end

    def title=(new_title)
        @title = new_title
    end

    def to_s
        "#{@title} has a rank of #{@rank}"
    end

end

if __FILE__ == $0

movie1 = Movie.new("goonies", 10)
movie1.thumbs_up
puts movie1.thumbs_up
puts movie1.rank
movie1.title = "ghostbusters"
puts movie1.title
movie2 = Movie.new("helloboy", 10)

end