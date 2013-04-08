require 'spec_helper'

describe MoviesController do
  describe 'show a specific movie' do
    it 'should call the model method that returns the movie with the ID' do
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find).with('1')
      post :show, :id => 1
    end
  end
end
