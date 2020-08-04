class Song < ApplicationRecord
 

    validates :title, presence: true, uniqueness: true
    validates :artist_name, presence: true, uniqueness: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    
    validate :check_dates

private
  def check_dates
     if self.release_year && self.release_year > Date.today.year
        self.errors.add(:release_year, "Can't be in the future") 
    end 
     
  end

end  

