class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # both of these will stop the process from running 
    #byebug
    
    return if tweet.published?
    
    # if someone reschedules a tweet to the future
    return if tweet.publish_at > Time.current
    
    tweet.publish_to_twitter
  end
end
