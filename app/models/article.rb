################################################################################
# Model:  Article
#
# Purpose:
#
# Article attributes:
#   title             - title:          string,  not NULL
#   author             - author:  string
#   content             - content:  text
#   status            - status:         enum { active (0) | archived (1) }
#
#  30.06.2017 ZT
################################################################################
class Article < ApplicationRecord

  enum status: %w(active archived)



  validates :title, presence: true

end
