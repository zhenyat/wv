################################################################################
# Model:  Picture
#
# Purpose:
#
# Picture attributes:
#   plant_id          - FK
#   name              - name:           string,  not NULL, unique
#   title             - title:          string,  not NULL
#   cover             - cover:  boolean
#   content           - content:  text
#   photo             - photo:  string
#   taken_at          - taken_at:  date
#   position          - sorting index:  integer, not NULL
#   status            - status:         enum { active (0) | archived (1) }
#
#  17.06.2017 ZT
#  24.06.2017 scope added
################################################################################
class Picture < ApplicationRecord
  belongs_to     :plant
  mount_uploader :photo, PhotoUploader
  before_save    :set_position
  after_save     :revise_cover_status

  enum status: %w(active archived)

  validates :plant, presence: true
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true

  scope :cover, -> {find_by(cover: true)}
  
  private

    # Revises cover status of pictures (only one *cover* picture is allowed for a plant)
    def revise_cover_status
      if self.cover?
        Plant.find(self.plant_id).pictures.each do |picture|
          if (picture.cover? && picture.id != self.id)
            picture.cover = false
            picture.save
          end
        end
      end
    end

    def set_position
      if self.id.blank?
        last_item = Picture.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
