class Group < ApplicationRecord
    belongs_to :exam
    has_many :belongings
    has_many_attached :group_files
end
