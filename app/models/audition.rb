class Audition < ActiveRecord::Base
    belongs_to :role

    def call_back
        self.update(is_hired: true)
    end
end