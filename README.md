User Story Format -

As a <Stakeholder>,
So that <Motivation>,
I'd like <Task>.

User Story - 1
`As a user,
So that I can find a particular page,
I'd like to be able to view a list of all my bookmarks.``

Objects | Messages
bookmark | list_all_bookmarks

User Story - 2

`As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager`

Objects | Messages
bookmark | add_bookmarks




Database Set-up:
`1 - Connect to psql
2 - Create the database using the psql command CREATE DATABASE bookmark_manager;
3 - Connect to the database using the pqsl command \c bookmark_manager;
4 - Run the query we have saved in the file 01_create_bookmarks_table.sql`
