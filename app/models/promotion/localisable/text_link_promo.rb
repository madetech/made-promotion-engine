if Promotion.config.localisable
  module Promotion
    module Localisable
      class TextLinkPromo < Promotion::Localisable::Promo
        translates                      :headline,
                                        :link
        active_admin_translates         :headline,
                                        :link
      end
    end
  end
end
