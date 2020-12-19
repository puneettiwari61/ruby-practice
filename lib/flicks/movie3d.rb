require_relative 'movie'

class Movie3d < Movie
    
    def initialize(title, rank, wow_factor)
        super(title, rank)
        @wow_factor = wow_factor
    end

    def show_effect
        @wow_factor.times {super}
    end

    def thumbs_up
        @rank += (1 * @wow_factor)
    end
end

# movie3d = Movie3d.new('glee',5)
# puts movie3d.title, movie3d.rank
# puts movie3d.show_effect
# puts movie3d.thumbs_up