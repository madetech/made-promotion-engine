if Promotion.config.localisable
  module Promotion
    module Localisable
      class Promo < Promotion::Promo
        translates                :title
        active_admin_translates   :title

        attr_accessible           :translations
      end
    end
  end
end
