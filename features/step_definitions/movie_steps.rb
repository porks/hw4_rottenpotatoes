# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date], :director => movie[:director])
  end
#  flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |item|
    if (uncheck)
      step "I uncheck \"ratings_#{item.strip}\""
    else
      step "I check \"ratings_#{item.strip}\""
    end
  end

end 

When /^I submit$/ do
  step "I press \"ratings_submit\""
end

Then /I should (not )?see movies with the ratings: (.*)/ do |not_see, rating_list|
  ratings = Array.new
  rating_list.split(',').each do |item|
    ratings.push(item.strip)
  end

  movies = Movie.find(:all, :conditions => ["rating IN (?)", ratings])
  movies.each do |movie|
    if (not_see)
      step "I should not see \"#{movie.title}\""
    else
      step "I should see \"#{movie.title}\""
    end
  end
end

Then /I should see all of the movies/ do
  movies = Movie.all
  movies.each do |movie|
    step "I should see \"#{movie.title}\""
  end
end

Then /I should see '(.*)' before '(.*)'/ do |movie_1st, movie_2nd|
  found_1st_movie = false
  found_2nd_movie = false
  page.body.scan(/<a href="\/movies\/[\d+]*">More about (.*)<\/a>/) do |movie_name|
    if (found_1st_movie)
      if (movie_name[0] == movie_2nd)
        found_2nd_movie = true
      end
      break
    end

    if (movie_name[0] == movie_1st)
      found_1st_movie = true
    end
  end

   assert found_1st_movie, "Could Not Found #{movie_1st}"

   assert found_2nd_movie, "Could Not Found #{movie_2nd}"
end


