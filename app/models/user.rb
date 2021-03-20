class User < ApplicationRecord
  validates :username, uniqueness: true, presence:true
  validates_presence_of :password_digest, require: true
  has_many :entries, dependent: :destroy

  has_secure_password

  def today_by_category(meal_type)
    entries.where(created_at: Date.today.all_day)
      .where(meal_type: meal_type)
      .group("category")
      .sum("serving")
  end
end
