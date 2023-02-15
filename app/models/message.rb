class Message < ApplicationRecord
  belongs_to :fan
  belongs_to :parlor

  validates :content, presence: true

  def date_created
    created_at.to_formatted_s(:long_ordinal)
  end
end
