namespace :rudequeue do
  task :process => :environment do
    Rudeq::SnapGeneratorWorker.new.do!
  end
end

