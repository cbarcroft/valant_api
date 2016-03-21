class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: [:show]
  before_action :set_inventory_item_by_label, only: [:remove]
  before_action :error_if_item_not_found, only: [:remove]

  # GET /inventory
  def index
    @inventory_items = InventoryItem.where(is_removed: false)
  end

  # GET /inventory/1
  def show
  end

  # POST /inventory
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    if @inventory_item.save
      render :show, location: @inventory_item
    else
      render json: @inventory_item.errors, status: :unprocessable_entity
    end
  end

  # PUT /inventory
  def remove
    @inventory_item.is_removed = true;
    if @inventory_item.save
        render json: { :message => "'#{@inventory_item.label}' has been successfully removed from inventory.", :success => true}
    else
        render json: { :errors => @inventory_item.errors, :success => false}, status: :unprocessable_entity
    end
  end

  private
    # Common function to find and return an inventory item by ID
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Common function to find and return an inventory item by label
    def set_inventory_item_by_label
      @inventory_item = InventoryItem.find_by(label: params[:label])
    end

    def error_if_item_not_found
      render json: { :error => "No item found with the label '#{params[:label]}'", :success => false }, status: 404
    end

    # Whitelist parameters related to the inventory item only.
    def inventory_item_params
      params.permit(:label, :expiration_date, :type, :location)
    end
end
