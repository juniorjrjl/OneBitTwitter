require 'rails_helper'

RSpec.describe UpdateTrendingsJob, type: :job do
  describe "UpdateTrendingsJob" do
    it "check if trendings was generated right" do
      DataStore.redis.flushall
      values = {}
      (1..20).each { |i| values["##{FFaker::Lorem.word}"] = i }
      values.each { |k, v| DataStore.redis.set(k, v)}
      UpdateTrendingsJob.perform_now
      Trending.last.hashtags.each { |k, v|  expect(values[k]).to eql(v.to_i)}
    end
  end
end
