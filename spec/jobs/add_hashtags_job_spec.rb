require 'rails_helper'

RSpec.describe AddHashtagsJob, type: :job do
  describe "AddHashtagsJob" do
    ActiveJob::Base.queue_adapter = :test
    it "get hashtags" do
      DataStore.redis.flushall
      hashtags = Array.new
      (0..8).each { hashtags.push "##{FFaker::Lorem.word}" }
      AddHashtagsJob.perform_now("simple #{hashtags[0]} #{hashtags[1]} #{hashtags[2]} to #{hashtags[3]} if it was #{hashtags[4]}, #{hashtags[5]} #{hashtags[6]} #{hashtags[7]} #{hashtags[8]} :)")
      hashtags.each{ |h|  expect(DataStore.redis.get(h)).not_to be_nil}
      expect(DataStore.redis.scan_each(match: '#*').count).to eql(hashtags.uniq.count)
    end
  end
end
