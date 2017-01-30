class Brand < ActiveRecord::Base
  belongs_to(:store)
  validates(:description, :presence => true)
  validates(:name, :presence => true)
  before_save(:title_case)

  private
  define_method(:title_case) do
    self.name = name.downcase.split(/(\W)/).map(&:capitalize).join
  end
end
