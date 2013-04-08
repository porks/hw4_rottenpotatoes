require 'spec_helper'

describe MoviesController do
  describe 'delete a specific movie' do
    it 'should call the model method that deletes the movie with the ID' do
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find).with('1')
      Movie.any_instance.stub(:title).and_return('Figaro')
      Movie.any_instance.should_receive(:destroy)
      post :destroy, :id => 1

      response.should redirect_to(movies_path)
      flash[:notice].should_not be(nil)
    end
  end
end
