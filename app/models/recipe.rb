class Recipe < ActiveRecord::Base
     validates :title,  presence: true
     validates :prep_time, numericality: { only_integer: true }
end
