class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Customer"
  belongs_to :rateable, :polymorphic => true
end
