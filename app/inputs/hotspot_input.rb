class HotspotInput
  include Formtastic::Inputs::Base

  def to_html
    return if object.carousel_promo_image.nil?

    input_wrapping do
      get_image(object) <<
      get_input_field
    end
  end

  private
  def get_image(object)
    return "".html_safe if !show_image?

    image = object.carousel_promo_image.image
    dimensions = get_half_size(Promotion.config.image_styles[:carousel][0])

    %Q{
      <div class="hotspot-image" id="hotspot-image-#{object.id}">
        <img src="#{image.url(:carousel)}" width="#{dimensions[:width]}" height="#{dimensions[:height]}">
      </div>
    }.html_safe
  end

  def get_input_field
    additional_options = {}
    additional_options[:class] = "hotspot-#{options[:hotspot]}" if options.has_key?(:hotspot)

    builder.hidden_field(method, additional_options.merge(input_html_options))
  end

  def get_half_size(dimension_str)
    dimensions = dimension_str.split('x')

    {
      :width => dimensions[0].to_i / 2,
      :height => dimensions[1].to_i / 2
    }
  end

  def show_image?
    !options.has_key?(:show_image) or options[:show_image]
  end
end
