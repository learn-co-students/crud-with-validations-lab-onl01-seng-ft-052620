class ReleaseValidator < ActiveModel::Validator 

    def validate(record)

        if record.release_year > Time.now.year
           record.errors[:release_year] << "Release can't be a future date"
        end

    end     
end 