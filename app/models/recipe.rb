# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  persons     :integer
#  ingredients :text
#  preparation :text
#  image       :binary
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
  attr_accessible :image, :ingredients, :persons, :preparation, :title
end
