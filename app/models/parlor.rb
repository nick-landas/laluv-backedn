class Parlor < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :members, through: :enrollments, source: :ufan
    has_many :messages, dependent: :destroy

    validates :name, presence: true, length: { maximum: 26 }
    validates :description, presence: true
end
