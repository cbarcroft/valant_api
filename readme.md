Hello!  Thank you for the opportunity to apply.

I have created the requested API using Ruby on Rails, and it is hosted at cbarcroft-valant.herokuapp.com (please allow 15-20 seconds for the application to start at first; Heroku puts them to sleep when they haven't been accessed very recently).

Available endpoints and HTTP verbs are as follows:

**GET** cbarcroft-valant.herokuapp.com/inventory

Retrieves a list of all current items in inventory

**POST** cbarcroft-valant.herokuapp.com/inventory

Creates a new inventory item.  Fields are:
'label' : String field for item label (also acts as unique identifier, as per requirements)
'type' : String field to identify type; I interpreted this a a drug classifier (e.g., 'Antiviral', 'Pain Relief', etc.)
'expiration_date' : String field for expiration date, with format yyyy-mm-dd
'location' : String field to identify inventory location, ex: 'SEA_WAREHOUSE', 'PDX_WAREHOUSE'

**PUT** cbarcroft-valant.herokuapp.com/inventory/remove

 Removes an item from the inventory.  Fields are:
'label' : String identifier for the desired item to remove.

The POST and PUT calls both return a JSON representation of the object, plus a boolean 'success' flag to indicate the result of the operation.


**To run locally:**

Install Ruby if not already available (comes default on OSX and Linux)
Download/clone code into desired local directory
From command line in directory, run 'gem install bundler', then 'bundle install', then 'rake db:create db:migrate db:seed', and finally 'rails s'
Application will be available at localhost:3000/inventory

**To run tests**:

From CLI, 'rake db:migrate db:seed RAILS_ENV=test', then 'rspec'

**Files of interest:**

app/controllers/inventory_items_controller.rb
app/models/inventory_item.rb
app/views/inventory_items/*
db/schema.rb
spec/*

The model contains the majority of the business logic, specifically in the validations around expired items or items that have already been removed from inventory.  This makes it easy to expand functionality without introducing bugs, since the model will prevent itself from entering an invalid state regardless of where it is used in the application.  I chose to use a sort of 'soft delete' in the form of an is_removed attribute, in order to preserve the inventory history.  Removed items are not selected into the index call, and cannot be 'removed' again.

Tests are written using Rspec and Factory_girl(to create testable data on the fly), and cover both the model logic and the actual API requests.  

Let me know if you have any questions or concerns - I'll be happy to change or expand features, particularly if my interpretation of the requirements was not entirely correct.  Have a great week! 

