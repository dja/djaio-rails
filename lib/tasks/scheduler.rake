desc 'This task is called by the Heroku scheduler add-on'
task update_tweets: :environment do
  puts 'Updating tweets...'
  TwitterSync.update
  puts 'done.'
end

task cleanup_tweets: :environment do
  puts 'Cleaning up tweets...'
  TwitterSync.cleanup
  puts 'done.'
end
