require 'store_scraper'
require 'pp'

jp_ranking = StoreScraper::Itunes::Ranking.new(limit: 10, country: 'jp', feed_type: 'topgrossingapplications', genre: 'games')
us_ranking = StoreScraper::Itunes::Ranking.new(limit: 10, country: 'us', feed_type: 'topgrossingapplications', genre: 'games')

first_jp_app = jp_ranking.find_by_rank(1)
pp first_jp_app.to_hash
# {
#   "id"        => 658511662,
#   "title"     => "モンスターストライク",
#   "bundle_id" => "jp.co.mixi.monsterstrike",
#   "category"  => "ゲーム",
#   "image"     => "http://is1.mzstatic.com/image/thumb/Purple69/v4/e0/25/5f/e0255fb1-9d87-3b6e-4c7b-027722d85023/mzl.afyfvfut.png/53x53bb-85.png",
#   "publisher" => "mixi, Inc",
#   "link"      => "https://itunes.apple.com/jp/app/monsutasutoraiku/id658511662?mt=8&uo=2",
#   "summary"   => "..."
# }

first_us_app = us_ranking.find_by_rank(1)
pp first_us_app.to_hash
# {
#   "id"        => 667728512,
#   "title"     => "Game of War - Fire Age",
#   "bundle_id" => "com.machinezone.ody0",
#   "category"  => "Games",
#   "image"     => "http://is2.mzstatic.com/image/thumb/Purple49/v4/20/7c/14/207c14b2-22d6-f1cc-b418-f1e54f70b7e5/mzl.tmgewreu.jpg/53x53bb-85.png",
#   "publisher" => "Machine Zone, Inc",
#   "link"      => "https://itunes.apple.com/us/app/game-of-war-fire-age/id667728512?mt=8&uo=2",
#   "summary"   => "..."
# }
