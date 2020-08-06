class Song < ActiveRecord::Base
validates :title, presence: true
validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Cannot release the same song twice in a year."}
validates :released, inclusion: { in: [true, false] }
validates :release_year, presence: true, if: :released
validate :no_future_dates
validates :artist_name, presence: true 

private

def no_future_dates
if self.release_year && self.release_year > Date.today.year 
    self.errors.add(:release_year, "Must be in the present time")
    end
  end
end