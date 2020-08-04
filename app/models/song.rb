class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: :release_year,
        message: "Can't release the same title song within the same year"
    }
    validates :release_year, presence: true, if: :released
    validates :artist_name, presence: true
    validate  :check_dates

    private

    def check_dates
        if self.release_year && self.release_year > Date.today.year
            self.errors.add(:release_year, "Can't be in the future")
        end
    end
end
