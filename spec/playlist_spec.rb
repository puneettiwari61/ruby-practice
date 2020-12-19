require_relative 'playlist'

module Flicks
    describe Playlist do
        before do
            @playlist = Playlist.new("hello")
        end

        context "being played with one movie" do
            before do
                @initial_rank = 10
                @movie = Movie.new("hello", @initial_rank)
                @playlist.add_movie(@movie)
            end

            it "gives the movie a thumbs up if a high number is rolled" do
            WaldorfAndStatler.stub(:roll_die).and_return(5)
            @playlist.play 2
            @movie.rank.should == @initial_rank + 1
            end

            it "skips the movie if a medium number is rolled" do
                WaldorfAndStatler.stub(:roll_die).and_return(3)
                @playlist.play 1

                @movie.rank.should == @initial_rank
            end

            it "gives the movie a thumbs down if low number is rolled" do
                WaldorfAndStatler.stub(:roll_die).and_return(1)

                @playlist.play 3

                @movie.rank.should == @initial_rank - 1
            end
        end

        end
end
    