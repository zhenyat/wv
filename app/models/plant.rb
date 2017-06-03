################################################################################
# Model:  Plant
#
# Purpose:
#
# Plant attributes:
#   grower_id          - FK
#   title_la           - title_la:          string
#   title              - title:             string,  not NULL
#   hybrid_parentage   - hybrid_parentage:  string
#   kind               - kind:              enum { 0 | 1 | 2}
#   zone_min           - zone_min:          integer
#   zone_max           - zone_max:          integer
#   quantity           - quantity:          integer
#   planted_in         - year of planting:  integer
#   position           - sorting index:     integer, not NULL
#   status             - status:            enum { active (0) | archived (1) }
#
#  01.06.2017 ZT
################################################################################
class Plant < ApplicationRecord
  belongs_to  :grower
  has_many    :pictures
  before_save :set_position

  enum kind:   %w(decidious evergreen herbacious)
  enum status: %w(active archived)

  validates :grower,   presence: true
  validates :title_la, presence: true
  validates :title,    presence: true
  validates :zone_min, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 11}
  validates :zone_max, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 11}
  validates :quantity, numericality: {greater_than_or_equal_to: 1}

  private

    def set_position
      if self.id.blank?
        last_item = Plant.order(:position).last
        self.position = last_item.blank? ? 1 : last_item.position.to_i + 1
      end
    end
end
