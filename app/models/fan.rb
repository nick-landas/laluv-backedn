class Fan < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :memberships, through: :enrollments, source: :parlor
    has_many :messages, dependent: :destroy
  
    def chatlog
        self.memberships.map do |membership|
         {
            parlor: membership.name,
            messages: membership.messages.select('messages.id, messages.content, messages.created_at').where(fan: self).last(5)
        }
    end
  end

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password
end
