class Category < ApplicationRecord
  has_many :operation_parts

  def self.food_created?
    Category.where(name: "Wyżywienie").exists?
    
  end

  def self.create_food_category
    Category.new(name: "Wyżywienie").save!
  end

  def self.food_category
    Category.where(name: "Wyżywienie").first
  end
end
