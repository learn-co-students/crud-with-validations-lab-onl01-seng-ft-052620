class EmailValidator < ActiveModel::Validator

    def validate(record)
        if recored.created_at != Date.today 
            recored.errors[:release_year] << 'cant be in past or future'
        end
    end
end