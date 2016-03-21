require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  it "creates an inventory item successfully" do
    FactoryGirl.create(:inventory_item)
    expect(InventoryItem.count).to eq(1)
  end

  it "creates 10 inventory items successfully" do
    10.times {FactoryGirl.create(:inventory_item)}
    expect(InventoryItem.count).to eq(10)
  end

  it "validates presence of label" do
    inventory_item = FactoryGirl.build(:inventory_item, label: nil)
    inventory_item.save
    expect(inventory_item.errors[:label].size).to eq(1)
  end

  it "validates presence of expiration_date" do
    inventory_item = FactoryGirl.build(:inventory_item, expiration_date: nil)
    inventory_item.save
    expect(inventory_item.errors[:expiration_date].size).to eq(1)
  end

  it "validates presence of type" do
    inventory_item = FactoryGirl.build(:inventory_item, type: nil)
    inventory_item.save
    expect(inventory_item.errors[:type].size).to eq(1)
  end

  it "validates presence of location" do
    inventory_item = FactoryGirl.build(:inventory_item, location: nil)
    inventory_item.save
    expect(inventory_item.errors[:location].size).to eq(1)
  end

  it "validates uniqueness of item labels" do
    FactoryGirl.create(:inventory_item, label: "Test Unique")
    second_item = FactoryGirl.build(:inventory_item, label: "Test Unique")
    second_item.save
    expect(second_item.errors[:label].size).to eq(1)
  end

  it "prevents removal of an item that has already been removed" do
    removed_item = FactoryGirl.create(:inventory_item, is_removed: true)
    removed_item.is_removed = true;
    removed_item.save

    expect(removed_item.errors[:is_removed].size).to eq(1)
  end

  it "prevents removal of an expired item" do
    expired_item = FactoryGirl.create(:expired_item)
    expired_item.is_removed = true;
    expired_item.save

    expect(expired_item.errors[:is_removed].size).to eq(1)
  end
end
