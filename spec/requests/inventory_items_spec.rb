require 'rails_helper'

RSpec.describe "Inventory API" do
  it 'retrieves a list of inventory items' do
    FactoryGirl.create_list(:inventory_item, 10)

    get '/inventory'

    json = JSON.parse(response.body)

    # Test for the 200 status-code
    expect(response).to be_success

    # Check to make sure the right amount of items are returned
    expect(json.length).to eq(10)
  end

  it 'creates a new inventory item' do
    post '/inventory', {:label => "Test Drug", :expiration_date => (Date.today + 1.month), :location => 'PDX_WAREHOUSE', :type => 'TEST_DRUG'}

    json = JSON.parse(response.body)

    # Test for the 200 status-code
    expect(response).to be_success

    # Ensure item was created and ID returned in response
    expect(json['id']).not_to eq(nil)
  end

  it 'removes an inventory item' do
    inventory_item = FactoryGirl.create(:inventory_item)
    put '/inventory/remove', {:label => inventory_item.label}

    json = JSON.parse(response.body)

    # Test for the 200 status-code
    expect(response).to be_success

    # Ensure JSON response indicates success of removal operation
    expect(json['success']).to eq(true)
  end

  it 'prevents removal of an expired inventory item' do
    expired_item = FactoryGirl.create(:expired_item)
    put '/inventory/remove', {:label => expired_item.label}

    json = JSON.parse(response.body)

    # Ensure JSON response indicates failure of removal operation
    expect(json['success']).to eq(false)
  end

  it 'prevents removal of an already removed item' do
    removed_item = FactoryGirl.create(:inventory_item, is_removed: true)
    put '/inventory/remove', {:label => removed_item.label}

    json = JSON.parse(response.body)

    # Ensure JSON response indicates failure of removal operation
    expect(json['success']).to eq(false)
  end
end
