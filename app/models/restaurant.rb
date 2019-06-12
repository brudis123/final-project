# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
    
    #belongs_to :dish, :class_name => "Restaurant", :foreign_key => "restaurant_id"
    #has_many :dishes, :dependent => :destroy
    belongs_to :address
    has_many(:dishes, { :class_name => "Dish", :foreign_key => "restaurant_id" })
end
