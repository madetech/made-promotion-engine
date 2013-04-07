module Promotion
  module ViewHelper
    def promo(placement)
      promos = Promotion::Promo.where(:placement => placement)
      return if promos.length < 1

      render :partial => promos.first.type.tableize.singularize, :locals => {:promos => promos}
    end
  end
end
