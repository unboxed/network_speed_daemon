require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :nsd do
  task :install do
    executable_path = `which daemon`.chomp
    plist_content = File.read(
      "lib/templates/com.speed_daemon.plist"
    ) % { executable_path: executable_path }

    FileUtils.mkdir("launchd")
    File.write("launchd/com.speed_daemon.plist", plist_content)

    `launchctl load launchd/com.speed_daemon.plist`
  end

  task :uninstall do
    `launchctl unload launchd/com.speed_daemon.plist`
    FileUtils.remove_dir("launchd")
  end
end

task :default => :spec
