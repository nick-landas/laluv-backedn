class Enrollment < ApplicationRecord
  belongs_to :fan
  belongs_to :parlor

  scope :current_member, ->(fan) { 
    select('enrollments.id, enrollments.fan_id, enrollments.parlor_id')
    .where(fan: fan)
    .first 
  }

  #validation needs to be tweaked possibly with updating locales file
  validates :fan, uniqueness: { 
    scope: :parlor, 
    message: -> (object, data) do
      "is already a member of #{object.parlor.name}"
    end
    }
end
