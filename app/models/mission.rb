class Mission < ApplicationRecord
    belongs_to :artisan

    def default_price
        if price == nil && (end_at && start_at)
          (end_at - start_at) * artisan.tjm
        elsif price
          price
        else
          0
        end
    end
end
