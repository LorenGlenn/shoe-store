class Brand < ActiveRecord::Base
  belongs_to(:store)
  validates(:description, :presence => true)
  validates(:name, :presence => true)
end
