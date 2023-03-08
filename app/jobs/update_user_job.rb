class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "updating location for #{user.email.split('@').first}"
    sleep 4
    user.location = "London"
    user.save
    puts "#{user.email.split('@').first}'s location set to #{user.location}"
  end
end
