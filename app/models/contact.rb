class Contact < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :groups
    has_many :notes, dependent: :destroy
    has_many :tasks, dependent: :destroy
end
