FactoryGirl.define do
  factory :linked_image_promo, class: Promotion::LinkedImagePromo do |f|
    f.id                    1
    f.title                 "Test"
    f.image_file_name       "image.jpg"
    f.image_content_type    "image/jpg"
    f.image_file_size       "12345"
    f.image_updated_at      "2013-01-01 00:00:00"
    f.image_link            "http://www.test.com"
    f.placement             "Homepage: Main"
  end
end
