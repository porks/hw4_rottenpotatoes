require 'spec_helper'

describe MoviesController do
  describe 'show movies' do
    it 'should call the model method that search for movies ordered by title' do
#      Movie.stub(:find).and_return(Movie.new)
#      Movie.should_receive(:find).with('1')
#      Movie.any_instance.stub(:title).and_return('Figaro')
#      Movie.any_instance.should_receive(:destroy)
      get :index, :sort => 'title'
    end
  end

  it 'should call the model method that search for movies ordered by release_date' do
#      Movie.stub(:find).and_return(Movie.new)
#      Movie.should_receive(:find).with('1')
#      Movie.any_instance.stub(:title).and_return('Figaro')
#      Movie.any_instance.should_receive(:destroy)
      get :index, :sort => 'release_date', :ratings => 'G'
  end
end
