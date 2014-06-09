if Promotion.config.localisable
  module Promotion
    module Localisable
      class VideoPromo < Promotion::Localisable::Promo
        translates                      :html
        active_admin_translates         :html
      end
    end
  end
end
