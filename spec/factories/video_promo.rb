FactoryGirl.define do
  factory :video_promo, class: Promotion::VideoPromo do |f|
    f.id 1
    f.title "Test"
    f.video_embed "http://www.example.com"
    f.placement "Homepage: Main"
  end
end
