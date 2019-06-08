# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string
#  cuisine_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  restaurant :string
#

class Dish < ApplicationRecord
    
  belongs_to :restaurant, :class_name => "Restaurant", :foreign_key => "restaurant_id"
    
end
