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
  
  desc "Show all"
  task :show => :environment do   
    ActiveRecord::Base.logger = Logger.new("/dev/null")
    empty = 0
    
    puts "     # slug      entries"
    puts "-" * 25
    Schedule.all.each do |schedule|
      esize = schedule.entries.count
      empty += 1 if esize == 0
      puts [schedule.id.to_s.rjust(6),
      schedule.slug.ljust(12),
      esize.to_s.ljust(3)].join(" ")
    end
    
    puts
    puts "Found #{empty} empty schedules"
  end
  
  desc "Automat test"
  task :automate => :environment do
    login = ENV["LOGIN"]
    password = ENV["PASSWORD"]
    
    Epure::Automate.run!(login, password)
  end
end
