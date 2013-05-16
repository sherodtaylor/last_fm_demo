require 'open-uri'
class Search
  attr_accessor :result
  def self.lastfm_api_call(user)
    api = "5e851473c4eb515d9edf03d0a720bfb9"
    file = open("http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=#{user}&api_key=#{api}&format=json")
    JSON.load(file.read)
  end

  def self.formatted_code(user)
    call = self.lastfm_api_call(user)
    api_call = call['topartists']['artist'].map{|a| { 'name' => a['name'], 'playcount' => a['playcount']}}
    hash = {
      'graph' => {
        'title' =>"Most Played",
        'total' => true,
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
