class WaterRight < ActiveRecord::Base
  belongs_to :user
  has_many :place_of_use_area_water_rights
  has_many :place_of_use_areas, through: :place_of_use_area_water_rights
  has_many :point_of_diversion_water_rights
  has_many :point_of_diversions, through: :point_of_diversion_water_rights
  validates :number, presence: true, uniqueness: true

# private
  
  def self.send_reminders(num_of_days)
    WaterRight.all.each do |water_right|
      if water_right.proof_due_date && (water_right.proof_due_date - num_of_days) == Date.today
        TransactionMailer.proof_due_date_reminder(water_right).deliver
      end
    end
  end
  # if proof_due_date_changed?
      # if proof_due_date_email_id
      #   mandrill = Mandrill::API.new ENV['MANDRILL_API_KEY']
      #   send_at = "#{proof_due_date - 2.months} 07:00:00"
      #   result = mandrill.messages.reschedule proof_due_date_email_id, send_at
      #   puts result
      #   if result["status"] && result["status"] == "error"
      #     logger.error "#{result["name"]}: #{result["message"]}"
      #   end
      # else
      #   result = TransactionMailer.proof_due_date_reminder(self).deliver
      #   if result.is_a?(Hash) && result["status"] == "error"
      #     logger.error "#{result["name"]}: #{result["message"]}"
      #   elsif result.is_a?(Array)
      #     self.update_column(:proof_due_date_email_id, result[0]["_id"])
      #   end
      # end
    # end

      # begin
      #   mandrill = Mandrill::API.new ENV['MANDRILL_API_KEY']
      #   send_at = "#{proof_due_date - 2.months} 07:00:00"
      #   # if proof_due_date_email_id
      #   #   result = mandrill.messages.reschedule proof_due_date_email_id, send_at
      #   #   # {"_id"=>"I_dtFt2ZNPW5QD9-FaDU1A",
      #   #   #  "created_at"=>"2013-01-20 12:13:01",
      #   #   #  "send_at"=>"2021-01-05 12:42:01",
      #   #   #  "from_email"=>"sender@example.com",
      #   #   #  "to"=>"test.recipient@example.com",
      #   #   #  "subject"=>"This is a scheduled email"}
      #   # else
      #     message = {
      #       "html"=>"<p>Hi #{user.email}!</p><p>Your water right, ##{number}, has a proof due date 2 months from today.</p>",
      #       "subject"=>"Proof Due Date Reminder",
      #       "from_email"=>"no-reply@riley-water.com",
      #       "from_name"=>"Riley Water Consulting",
      #       "to"=>[{"email"=>user.email}],
      #       "auto_text"=>true
      #     }
      #     async = false
      #     ip_pool = "Main Pool"
      #     result = mandrill.messages.send message, async, ip_pool
      #     # self.update_column(:proof_due_date_email_id, result[0]["_id"])
      #     # [{"email"=>"recipient.email@example.com",
      #     #     "status"=>"sent",
      #     #     "reject_reason"=>"hard-bounce",
      #     #     "_id"=>"abc123abc123abc123abc123abc123"}]
      #   # end
      # rescue Mandrill::Error => e
      #     # Mandrill errors are thrown as exceptions
      #     puts "A mandrill error occurred: #{e.class} - #{e.message}"
      #     # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
      #     raise
      # end
end
