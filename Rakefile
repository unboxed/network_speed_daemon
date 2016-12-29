require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :nsd do
  task :install do
    executable_path = `which daemon`.chomp
    launchd_path = File.expand_path("launchd")
    error_log_path = File.join(launchd_path, "error.log")
    log_path = File.join(launchd_path, "out.log")

    unless File.exist?(launchd_path)
      FileUtils.mkdir(launchd_path)
      FileUtils.touch(error_log_path)
      FileUtils.touch(log_path)
    end

    plist_content = File.read(
      "lib/templates/com.speed_daemon.plist"
    ) % { executable_path: executable_path, log_path: log_path, error_log_path: error_log_path }

    File.write("launchd/com.speed_daemon.plist", plist_content)

    `launchctl load launchd/com.speed_daemon.plist`
  end

  task :uninstall do
    `launchctl unload launchd/com.speed_daemon.plist`
    FileUtils.remove_dir("launchd")
  end
end

task :default => :spec
