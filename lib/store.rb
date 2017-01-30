class Store < ActiveRecord::Base
  has_many(:brands)
  validates(:name, :presence => true)
  before_save(:title_case)

  private
  define_method(:title_case) do
    self.name = name.downcase.split(/(\W)/).map(&:capitalize).join
  end
end
