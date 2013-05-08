module Promotion
  module ViewHelper
    def promo(placement, market = false)
      promos = Promotion::Promo.where(get_conditions(placement, market))
      return if promos.length < 1

      render :partial => promos.first.type.tableize.singularize, :locals => {:promos => promos}
    end

    private
    def get_conditions(placement, market)
      conditions = {:placement => placement}

      conditions[:market] = market if Promotion.config.localisable and market

      conditions
    end
  end
end
