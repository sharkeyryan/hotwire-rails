# frozen_string_literal: true

class << self
  def seed_a_tweet(content:)
    Tweet.create(
      content: content
    ) do |r|
      puts "A #{r.class.name} has been seeded."
    end
  end
end

seed_a_tweet(
  content: "<p>This is a seeded tweet.</P>"
)

seed_a_tweet(
  content: "<p>This is <b>also</b> a seeded tweet.</P>"
)