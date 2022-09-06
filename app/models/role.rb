class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
        #or: self.auditions.pluck(:actor)
    end

    def locations
        self.locations.map do |location|
            location
        end
        #or: self.auditions.pluck(:location)
    end

    def lead
        #audition = self.auditions.find{|audition| audition.is_hired}
        if auditions.where(is_hired = true)
            self.auditions.first
        #if audition
            #audition
        else
            "no actor has been hired for this role"
        end
    end

    def understudy
        #auditions = self.auditions.filter{|audition| audition.is_hired}
        if auditions.where(is_hired = true)
            self.auditions.second
        #if auditions[1]  OR: if auditions.length >= 2
            #auditions[1]
        else
            "no actor has been hired for understudy for this role"
        end
    end
end