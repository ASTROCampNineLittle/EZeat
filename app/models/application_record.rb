class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
    def self.random
      self.order(Arel.sql('RANDOM()')).first
    end
end
