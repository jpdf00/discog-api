class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_by_id, -> { order(id: :asc) }
  scope :order_by_name, -> { order(name: :asc) }
end
