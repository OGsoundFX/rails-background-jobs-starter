class User < ApplicationRecord
  after_create :async_update # Run on create & update
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def async_update
    UpdateUserJob.perform_later(self)
  end
end
