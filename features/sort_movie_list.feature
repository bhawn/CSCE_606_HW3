Feature: display list of movies sorted by different criteria

  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  # And "2001: A Space Odyssey" exists
  # 09-MoreBDD-TDD-2.pptx
  # Then I should see "2001: A Space Odyssey" before "When Harry Met Sally"
  Then I should see "2001: A Space Odyssey" before "Aladdin"
  Then I should see "Aladdin" before "Amelie"
  Then I should see "Amelie" before "Chicken Run"
  Then I should see "Chicken Run" before "Chocolat"
  Then I should see "Chocolat" before "Raiders of the Lost Ark"
  Then I should see "Raiders of the Lost Ark" before "The Help"
  Then I should see "The Help" before "The Incredibles"
  Then I should see "The Incredibles" before "The Terminator"
  Then I should see "The Terminator" before "When Harry Met Sally"

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  # your steps here
  # Then I should see "1968-04-06 00:00:00 UTC" before "2011-08-10 00:00:00 UTC"
  Then I should see "1968-04-06 00:00:00 UTC" before "1981-06-12 00:00:00 UTC"
  Then I should see "1981-06-12 00:00:00 UTC" before "1984-10-26 00:00:00 UTC"
  Then I should see "1984-10-26 00:00:00 UTC" before "1989-07-21 00:00:00 UTC"
  Then I should see "1989-07-21 00:00:00 UTC" before "1992-11-25 00:00:00 UTC"
  Then I should see "1992-11-25 00:00:00 UTC" before "2000-06-21 00:00:00 UTC"
  Then I should see "2000-06-21 00:00:00 UTC" before "2001-01-05 00:00:00 UTC"
  Then I should see "2001-01-05 00:00:00 UTC" before "2001-04-25 00:00:00 UTC"
  Then I should see "2001-04-25 00:00:00 UTC" before "2004-11-05 00:00:00 UTC"
  Then I should see "2004-11-05 00:00:00 UTC" before "2011-08-10 00:00:00 UTC"
  
  
