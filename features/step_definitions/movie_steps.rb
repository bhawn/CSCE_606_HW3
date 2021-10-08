# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # page.body.index(e1).should < page.body.index(e2) # alternative method. 
  # 09-MoreBDD-TDD-2.pptx slide 8
  regexp = /#{e1}.*#{e2}/m # /m means match across newlines
  page.body.should =~ regexp

  # fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  rating_list = rating_list.split(/,\s?/)
  rating_list.each do |rating|
    if uncheck.blank?
      check("ratings_#{rating}")
    else
      uncheck("ratings_#{rating}")
    end
  end
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
end



Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  # Kernel.puts page.all("table#movies tbody tr").count
  expect(page.all("table#movies tbody tr").count).to eq Movie.all.count
end


# ==============================================================================

# return table column as array
def get_table_column(table_id, column_name)
  within_table(table_id) do
    col_id = nil
    within("thead tr:first") do       # within first tr in thead
      col_id = all("th").map(&:text).find_index(column_name) # .collect{ |val| val.text }
      col_id.should_not be_nil
      col_id += 1
    end
    return all("tbody tr > td:nth-child(#{col_id})").collect{ |val| val.text }
  end
end



# take on checking column values. should probably handle more
Then /I should (not )?see (.*) in column (.*) in table (.*)/ do |neg, col_values, column_name, table_id|
  col = get_table_column(table_id, column_name) # get table column
  col_values = col_values.split(/,\s?/)   # Split rating values to find
  col.each do |val|
    !neg.blank? ? (col_values.should_not include(val)) : (col_values.should include(val))
  end
end

# ==============================================================================

Then /^checkbox "([^"]*)" should (not )?be checked$/ do |ids, negate|
  ids = ids.split(/,\s?/)
  ids.each do |id|
    if negate.blank?
      page.find("##{id}").should be_checked
    else
      page.find("##{id}").should_not be_checked
    end
  end
end