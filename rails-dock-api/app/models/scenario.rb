class Scenario < ApplicationRecord
  after_initialize do |scenario|
    scenario.sun_exploded = 50.times.map{ [true, false].sample }.tally.max_by{|k,v| v}[0]
    scenario.dice = 2.times.map{ rand(1..6) }
  end

  def lied?
    self.dice.sum == 12
  end
end
