FactoryGirl.define do
  factory :image_text_promo_link, class: Promotion::ImageTextPromoLink do |f|
    f.id                  1
    f.text_field          "Example"
    f.text_field_link     'http://www.example.com'
  end
end
