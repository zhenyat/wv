################################################################################
# Model:  Grower
#
# Purpose:
#
# Grower attributes:
#   name         - name:              string,  not NULL, unique
#   title        - title:             string,  not NULL
#   address      - address:           string
#   phone        - phone:             string
#   url          - url:               string
#   about        - about company:     string
#   description  - description:       text
#   logo         - carrierWave image: string
#   status       - status:            enum { active (0) | archived (1) }
#
#  29.05.2017 ZT
################################################################################
class Grower < ApplicationRecord
  has_many       :plants
  mount_uploader :logo, LogoUploader
  
  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
