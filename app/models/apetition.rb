class Apetition < ApplicationRecord
    default_scope {order("residence_id")}
end
