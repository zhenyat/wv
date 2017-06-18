################################################################################
# Model:  Overview
#
# Purpose: Images handling for carousel, etc.
#
# Overview attributes:
#   name              - name:                 string,  not NULL, unique
#   title             - title:                string,  not NULL
#   carousel          - image for carousel:   boolean
#   content           - content:              text
#   image             - image filename:       string
#   taken_at          - taken_at:             date
#   position          - sorting index:        integer, not NULL
#   status            - status:               enum { active (0) | archived (1) }
#
#  17.06.2017 ZT
################################################################################
class Overview < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save    :set_position

  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true

  private

    def set_position
      if self.id.blank?
        last_item = Overview.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
