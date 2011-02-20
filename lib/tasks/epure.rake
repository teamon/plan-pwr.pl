namespace :epure do
  desc "Delete empty schedules"
  task :cleanup => :environment do
    Schedule.all.select{|s| s.entries.empty?}.each {|s| s.destroy }
  end
  
  desc "Clear cached schedules"
  task :clear_cache => :environment do
    FileUtils.rm_r(File.join(Epure.cache_root))
    FileUtils.mkdir_p(File.join(Epure.cache_root))
  end
end
