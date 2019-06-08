class Dish < ApplicationRecord
    
  has_many :dishes, :class_name => "Dish", :foreign_key => "restaurant_id"

end