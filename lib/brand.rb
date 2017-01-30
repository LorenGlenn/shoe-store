class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:description, :presence => true)
  validates(:name, :presence => true)
  before_save(:title_case)

  private
  define_method(:title_case) do
    self.name = name.downcase.split(/(\W)/).map(&:capitalize).join
  end
end
