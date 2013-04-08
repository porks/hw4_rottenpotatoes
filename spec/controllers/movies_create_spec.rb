require 'spec_helper'

describe MoviesController do

  describe 'create a movie' do
    it 'should call the model method that creates the movie' do
      movie_attr = { "title" => 'abc', "rating" => "G" }
     Movie.stub(:create!).and_return(Movie.new)
      Movie.should_receive(:create!).with(movie_attr)

#      Movie.any_instance.stub(:title).and_return('Figaro')
#     Movie.any_instance.should_receive(:destroy)
      post :create, :movie => movie_attr

      response.should redirect_to(movies_path)
      flash[:notice].should_not be(nil)
    end
  end
end
