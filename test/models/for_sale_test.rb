require 'test_helper'

class ForSaleTest < ActiveSupport::TestCase

  test 'has valid test data' do
    for_sale = build(:for_sale)
    assert_valid for_sale
  end

  test 'must have a description and price' do
    invalid_for_sale = ForSale.new  
    assert_invalid invalid_for_sale
    assert_includes invalid_for_sale.errors[:description], "can't be blank"
    assert_includes invalid_for_sale.errors[:price], "can't be blank"
  end

end
