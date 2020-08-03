class Song < ApplicationRecord
    
    validates :title, presence: true
    validates :release_year, presence: true, if: :released
    validates :title, uniqueness: { scope: %i[release_year artist_name], message: "should happen once per year"}
    validates :release_year, future: false
    
end 
    
