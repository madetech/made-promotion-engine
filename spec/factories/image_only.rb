FactoryGirl.define do
  factory :image_only_promo, class: Promotion::ImageOnlyPromo do |f|
    f.id                        1
    f.title                     "Test"
    f.image_file_name           "image.jpg"
    f.image_content_type        "image/jpg"
    f.image_file_size           "12345"
    f.image_updated_at          "2013-01-01 00:00:00"
    f.placement                 "Homepage: Main"
  end
end
