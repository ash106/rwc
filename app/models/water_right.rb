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
        TransactionMailer.proof_due_date_reminder(water_right).deliver_now
      end
    end
  end
end
