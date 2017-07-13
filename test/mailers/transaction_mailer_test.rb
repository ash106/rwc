require 'test_helper'

class TransactionMailerTest < ActionMailer::TestCase

  test 'proof_due_date_reminder' do
    user = create(:user)
    water_right = create(:water_right, number: '555-555', proof_due_date: '2016-01-25')
    user.water_rights << water_right
    email = TransactionMailer.proof_due_date_reminder(water_right).deliver_now
    assert_equal [user.email], email.to
    assert_equal ['no-reply@riley-water.com'], email.from
    assert_equal 'Proof Due Date Reminder for #555-555', email.subject
    # email.body.parts[0] is plain text, email.body.parts[1] is html
    assert_match '555-555', email.body.parts[0].to_s
    assert_match 'January 25th, 2016', email.body.parts[0].to_s
    assert_match '555-555', email.body.parts[1].to_s
    assert_match 'January 25th, 2016', email.body.parts[1].to_s
    assert ActionMailer::Base.deliveries.any?, 'expected a proof due date reminder email to be delivered'
    ActionMailer::Base.deliveries.clear
  end

end
