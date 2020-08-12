class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, presence: true, if: :released
    validates :title, uniqueness: { scope: %i[release_year artist_name], message: "should happen once per year"}

    validate :no_future_dates
    private 

    def no_future_dates 
        if self.release_year && self.release_year > Date.today.year 
            self.errors.add(:release_year, "Cant be in the future")
        end 
    end 
    
    
end 
    
