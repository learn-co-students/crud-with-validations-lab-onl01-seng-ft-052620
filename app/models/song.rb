class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, presence: true, uniqueness: {scope: :release_year}, if: :released

  validate :check_dates

  private
    def check_dates
      # release_year_exists =  Song.where(title: self.title, release_year: self.release_year)
      if self.release_year && self.release_year > Date.today.year 
        self.errors.add(:release_year, "Can't be in the future")
      # elsif !release_year_exists.empty?
      #   self.errors.add(:release_year, "Can't be released the same year")
      end
    end
end
