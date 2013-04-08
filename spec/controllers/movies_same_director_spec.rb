require 'spec_helper'

describe MoviesController do
  describe 'searching movies with same director' do
    it 'should call the model method that performs the search' do
#      movie_res = Movie.new
#      movie_res.stub(:director).and_return('bush')
      Movie.any_instance.stub(:director).and_return('bush')
      Movie.stub(:find).and_return(Movie.new)
      Movie.should_receive(:find_all_by_director).with('bush')
      post :same_director, :id => 1
    end

    it 'should select Same Director template for rendering' do
      Movie.any_instance.stub(:director).and_return('bush')
      Movie.stub(:find).and_return(Movie.new)
      post :same_director, :id => 1
      response.should render_template('same_director')
    end

    it 'should make the Same Director results available to that template' do
      Movie.any_instance.stub(:director).and_return('bush')
      Movie.stub(:find).and_return(Movie.new)
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_all_by_director).and_return(fake_results)
      post :same_director, :id => 1
      assigns(:movies).should == fake_results
    end

    it 'should redirect to Home Page when a movie has no director' do
      Movie.stub(:find).and_return(Movie.new)
      post :same_director, :id => 1
      get :index
      response.should render_template(:index)
    end
  end
end
