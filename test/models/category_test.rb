require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end
  test "category should be valid" do
    assert @category.valid?
  end

  test "name shoudl be present" do
    @category.name = " "
    assert_not @category.valid?
  end
end