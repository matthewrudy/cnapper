Thread.new do
  EM.run do
    Nanite.start_mapper(:host => 'localhost', :user => 'mapper', :pass => 'testing', :vhost => '/nanite', :log_level => 'info')
  end
end unless ENV["ignore-nanite-mapper"]
