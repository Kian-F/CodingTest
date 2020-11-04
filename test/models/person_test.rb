require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save person without name" do
    person = Person.new
    assert_not person.save
  end
end
