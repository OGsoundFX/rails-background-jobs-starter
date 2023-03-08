namespace :user do
  desc "update all users"
  task update_all: :environment do
    users = User.all
    puts "Relocating #{users.count}} users to London"
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end

end
