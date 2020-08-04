class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, presence: true, uniqueness: {scope: :release_year}, if: :released
  validate :no_future_dates

  private
  
  def no_future_dates
    if self.release_year && self.release_year > Date.today.year
      self.errors.add(:release_year, "Can't be in the future")
    end
  end
end


