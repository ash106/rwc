class TransactionMailer < MandrillMailer::TemplateMailer
  default from: 'no-reply@riley-water.com', from_name: 'Riley Water Consulting'
 
  def proof_due_date_reminder(water_right)
    mandrill_mail template: 'proof-due-date-reminder',
      subject: 'Proof Due Date Reminder',
      to: {email: water_right.user.email},
      vars: {
        'WATER_RIGHT_NUM' => water_right.number,
        'MONTH' => water_right.proof_due_date.strftime("%B"),
        'DAY' => water_right.proof_due_date.day,
        'EMAIL' =>  water_right.user.email,
        'PROOF_DUE_DATE' => water_right.proof_due_date.strftime("%B #{water_right.proof_due_date.day.ordinalize}, %Y")
      },
      important: true,
      inline_css: true
      # send_at: "#{water_right.proof_due_date - 2.months} 07:00:00".to_datetime
      # async: true
      # send_at: "#{proof_due_date - 2.months} 07:00:00"
  end
end