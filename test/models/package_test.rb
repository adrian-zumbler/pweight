require 'test_helper'

class PackageTest < ActiveSupport::TestCase
  test "Create Package" do
    parcel Parcel.create(length: 2)
   end
end
