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

	AWARD_THRESHOLDS = {
		medal: 3,
		plaque: 5,
		bronze: 7,
		silver: 10,
		gold: 14
	}.freeze

	def honour_award
		eligible_awards = AWARD_THRESHOLDS.select { |name, threshold| self.count >= threshold }.keys.map(&:to_s)
		current_awards = self.awards.pluck(:name)

		(eligible_awards - current_awards).each do |award_name|
				self.awards.create(name: award_name)
		end

		(current_awards - eligible_awards).each do |award_name|
				self.awards.find_by(name: award_name)&.destroy
		end
	end


	def has_award(award_name)
		self.awards.pluck(:name).include?(award_name.to_s)
	end
end
