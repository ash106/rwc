class TransactionMailer < ActionMailer::Base
  default from: 'Riley Water Consulting <no-reply@riley-water.com>'
 
  def proof_due_date_reminder(water_right)
    @water_right = water_right
    mail( to: @water_right.user.email,
    subject: "Proof Due Date Reminder for ##{@water_right.number}" )
  end
end