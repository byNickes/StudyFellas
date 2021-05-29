class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def displayed_image
    if image.attached?
      image
    else
      "default_image.png"
    end
  end

end
