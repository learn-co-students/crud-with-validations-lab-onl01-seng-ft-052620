class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validate :release_year_required
    validate :release_date_must_be_in_the_past  


    def release_year_required
        if released
            errors.add(:customer_id, "is not active") unless
            release_year?
        end
    end


    def release_date_must_be_in_the_past
        if release_year.present? && release_year >= Date.today.year
          errors.add(:release_year, "can't be in the past")
        end
      end

end
