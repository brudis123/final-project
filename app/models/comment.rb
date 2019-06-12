# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  dish_id    :integer
#  body       :text
#

class Comment < ApplicationRecord
  has_one :dish, :dependent => :destroy
end
