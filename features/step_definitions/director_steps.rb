Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_name, director_name|
  movie = Movie.find(:all, :conditions => ["title = ?", movie_name])
  movie[0].director == director_name
end
