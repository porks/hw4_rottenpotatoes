require 'spec_helper'

describe MoviesController do
  describe 'edit a specific movie' do
    it 'should call the model method that returns the movie with the ID' do
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find).with('1')
      post :edit, :id => 1
    end

    it 'should select edit template for rendering' do
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find).with('1')
      post :edit, :id => 1
      response.should render_template('edit')
    end

    it 'should update the movie model' do
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find).with('1')
      post :edit, :id => 1

      Movie.any_instance.should_receive(:update_attributes!)
      Movie.any_instance.stub(:id).and_return(1)
      put :update, :id => 1, :movie => Movie.new

      response.should redirect_to(movie_path(1))
      flash[:notice].should_not be(nil)
    end

  end
end
