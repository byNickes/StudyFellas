class Group < ApplicationRecord
    belongs_to :exam
    has_many :belongings
end
