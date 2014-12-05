require 'test_helper'
require 'mandrill_mailer/offline'

class AgentMailerTest < ActionMailer::TestCase

  test 'proof_due_date_reminder' do
    # water_right = MandrillMailer::Mock.new({
    #   number: '555-555',
    #   proof_due_date: '2016-01-25'.to_date,
    #   user: { email: 'tester@example.com' }
    # })
    user = create(:user)
    water_right = create(:water_right, number: '555-555', proof_due_date: '2016-01-25')
    user.water_rights << water_right
    TransactionMailer.proof_due_date_reminder(water_right).deliver
    email = MandrillMailer::deliveries.detect { |mail|
      mail.template_name == 'proof-due-date-reminder' &&
      mail.message['to'].any? { |to| to[:email] == user.email }
    }
    assert_equal user.email, email.message['to'][0][:email]
    assert_equal 'no-reply@riley-water.com', email.message['from_email']
    assert_equal 'Proof Due Date Reminder for #555-555', email.message['subject']
    assert_equal '555-555', email.message['global_merge_vars'][0]['content']
    assert_equal 'January 25th, 2016', email.message['global_merge_vars'][4]['content']
    MandrillMailer.deliveries.clear
    # assert ActionMailer::Base.deliveries.any?, 'expected a welcome email to be delivered'
  end

end