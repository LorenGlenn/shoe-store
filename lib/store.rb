class Store < ActiveRecord::Base
  has_many(:brands)
  validates(:name, :presence => true)
end
