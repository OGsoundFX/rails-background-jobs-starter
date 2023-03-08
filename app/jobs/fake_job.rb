class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "performing fake job"
    sleep 5
    puts "fake job done!"
  end
end
