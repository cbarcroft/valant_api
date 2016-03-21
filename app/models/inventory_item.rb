class InventoryItem < ActiveRecord::Base
  # Label Validations
  validates :label, presence: true
  validates :label, uniqueness: true

  # Expiration Date Validations
  validates :expiration_date, presence: true

  # Location Validations
  validates :location, presence: true

  # Type Validations
  validates :type, presence: true

  # Is Removed? Validations
  validate :cannot_remove_if_already_removed
  validate :cannot_remove_if_expired

  # To avoid problem with column named 'type'; Rails attempts to use this column as an inheritance class designator.
  self.inheritance_column = "inheritance_type"

  private

  # Validation method to prevent removal of items that have already been removed.
  def cannot_remove_if_already_removed
    if self.is_removed_was == true && self.is_removed
      errors.add(:is_removed, "You cannot remove an item that has already been removed from inventory.")
      return false 
    end
  end

  # Validation method to prevent removal of items that have expired.
  def cannot_remove_if_expired
    if self.is_removed_was == false && self.is_removed && self.expiration_date <= Date.today
      errors.add(:is_removed, "You cannot remove an item that has expired.")
      return false 
    end
  end


end
