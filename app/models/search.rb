require 'open-uri'
class Search
  def self.lastfm_api_call(user)
    file = open("http://ws.audioscrobbler.com/2.0/?method=user.getweeklyartistchart&user=#{user}&api_key=#{ENV['LAST_FM_API']}&format=json")
    JSON.load(file.read)['weeklyartistchart']['artist']
  end
end
