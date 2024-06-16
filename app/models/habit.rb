class Habit < ApplicationRecord
    belongs_to :user, counter_cache: :habits_count, touch: true
    has_many :awards, dependent: :destroy

    
    validates :name, presence: true
    validates :count, presence: true

    scope :ordered, -> { order(updated_at: :desc) }

     before_update :check_count
     before_update :honour_award

    def check_count
        self.count = 0 if count < 0
    end

    def honour_award
        habit = self.count
        case habit
        when 3
            awarded(:medal)
        when 5
            awarded(:plaque) 
        when 7
            awarded(:bronze)
        when 10
            awarded(:silver)
        when 14
            awarded(:gold)
        end
    end

    def awarded(award_name)
        if has_award(award_name) == false
            self.awards.create(name: award_name) 
        end
    end

    def has_award(award_name)
        self.awards.pluck(:name).include?(award_name.to_s)
    end



        
end
