require_relative 'movie'

describe Movie do

    before do
        @initial_rank = 10
        @movie = Movie.new("hey",@initial_rank)
    end

    it "has a capitalized title" do

        @movie.title.should == "Hey"
    end

    it "has a capitalized title" do

        @movie.rank.should == 10
    end

    it "has a string representation" do
        @movie.to_s.should == "Hey has a rank of 10"
    end


    it "increased rank by 1 when given a thumbs up" do

        @movie.thumbs_up.should == @initial_rank + 1
    end

    it "decreased rank by 1 when given a thumbs down" do
    
        @movie.thumbs_down.should == @initial_rank - 1
    end

    context "created with default rank" do
        before do 
            @movie = Movie.new("hey")
        end

        it "has a rank of 0" do
            @movie.rank.should == 0
        end
    end

    context "with a rank of at least 10" do
        before do 
            @movie = Movie.new("hey",10)
        end

        it "is a hit" do
         @movie.should be_hit
        end

        it "has a hit status" do
            @movie.status.should == "Hit"
        end
         
    end

    context "with a rank of less than 10" do
        before do 
            @movie = Movie.new("hey",9)
        end

        it "is not a hit" do
            @movie.should_not be_hit
        end

        it "has a flop status" do
            @movie.status.should == "Flop"
        end
         
    end

end