class Monster < ActiveRecord::Base
  validates :name, presence: true
  validates :level, presence: true
  validates :treasure, presence: true
end