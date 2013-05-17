require 'open-uri'
class Search
  def self.lastfm_api_call(user)
    file = open("http://ws.audioscrobbler.com/2.0/?method=user.getweeklyartistchart&user=#{user}&api_key=#{ENV['LAST_FM_API']}&format=json")
    JSON.load(file.read)
  end

  def self.formatted_code(user)
    call = self.lastfm_api_call(user)
    api_call = call['weeklyartistchart']['artist'].map{|a| { 'name' => a['name'], 'playcount' => a['playcount']}}
    hash = {
      'graph' => {
        'title' =>"Weekly",
        'total' => true,
        'xAxis' => { 'showEveryLabel' => true },
        'datasequences' => {
           'title' => "Top Artist's for #{user}",
           'datapoints' =>
              api_call
        }
      }
    }
    hash
  end
end
