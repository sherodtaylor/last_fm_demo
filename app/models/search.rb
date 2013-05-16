require 'open-uri'
class Search
  attr_accessor :result
  def self.lastfm_api_call(user)
    file = open("http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=#{user}&api_key=#{ENV['LAST_FM_API']}&format=json")
    JSON.load(file.read)
  end

  def self.formatted_code(user)
    call = self.lastfm_api_call(user)
    api_call = call['topartists']['artist'].map{|a| { 'name' => a['name'], 'playcount' => a['playcount']}}
    hash = {
      'graph' => {
        'title' =>"#{user}'s Top Artist's",
        'total' => true,
        'datasequences' =>
          api_call
      }
    }
    hash
  end
end
