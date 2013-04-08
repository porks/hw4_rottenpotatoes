require 'spec_helper'

describe MoviesController do
  describe 'adding a new movie' do

    it 'should select new movie template for rendering' do
      post :new
      response.should render_template('new')
    end
  end
end
