class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, :date, presence: true
  default_scope { order("position ASC") }
end
