
FactoryGirl.define do
  #factory :feed do
  #  id "1111"
  #end

  factory :entry do
    title "title_hoge"
    url "http://hoge/"
    summary "summary hoge hoge"
    published_at ""
    view_count "9"
    feed_id "1111"
  end
end