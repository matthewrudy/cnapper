task :snap => :environment do
  worker = Rudeq::SnapGeneratorWorker.new
  loop do
    worker.do!
    sleep 5
  end
end

