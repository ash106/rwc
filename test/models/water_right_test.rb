require 'test_helper'
require 'mandrill_mailer/offline'

class WaterRightTest < ActiveSupport::TestCase
  
  # test 'how does this work' do
  #   water_right = create(:water_right)
  #   puts water_right.place_of_use_areas.first.name
  #   puts water_right.point_of_diversions.first.name
  #   puts water_right.user.email
  # end

  test 'has valid test data' do
    water_right = build(:water_right)
    assert_valid water_right
  end

  test 'must have a number' do
    invalid_water_right = WaterRight.new  
    assert_invalid invalid_water_right
    assert_includes invalid_water_right.errors[:number], "can't be blank"
  end

  test 'must have a unique number' do
    water_right = create(:water_right)
    copy_cat = WaterRight.new(number: water_right.number)
    assert_invalid copy_cat, number: 'has already been taken'
  end

  test 'send_reminders sends emails for the correct water_rights' do
    user = create(:user)
    correct_water_right = create(:water_right, number: '777-777', proof_due_date: (Date.today + 60.days))
    wrong_water_right = create(:water_right, number: '555-555', proof_due_date: (Date.today + 61.days))
    user.water_rights << correct_water_right
    WaterRight.send_reminders(60.days)
    assert_equal 1, ActionMailer::Base.deliveries.count
    email = ActionMailer::Base.deliveries.first
    assert_equal [user.email], email.to
    assert_equal 'Proof Due Date Reminder for #777-777', email.subject
    ActionMailer::Base.deliveries.clear
  end

end
