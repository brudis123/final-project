# == Schema Information
#
# Table name: dishes
#
#  id            :integer          not null, primary key
#  name          :string
#  cuisine_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#  photo         :string
#  comment_id    :integer
#  user_id       :integer
#

class Dish < ApplicationRecord
    
  mount_uploader :photo, PhotoUploader
  
  belongs_to :restaurant, :class_name => "Restaurant", :foreign_key => "restaurant_id"
  belongs_to :cuisine, :class_name => "Cuisine", :foreign_key => "cuisine_id"
end
