class Artisan < ApplicationRecord
    has_and_belongs_to_many :skills
    has_many :missions
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :siret, presence: true, uniqueness: true
    validates :tjm, presence: true
end
