require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :nsd do
  task :install do
    speed_daemon_api_host = ENV["SPEED_DAEMON_API_HOST"]
    executable_path = `which daemon`.chomp
    launchd_path = File.expand_path("launchd")
    error_log_path = File.join(launchd_path, "error.log")
    log_path = File.join(launchd_path, "out.log")

    launchd_lib_path = File.join(ENV["HOME"], "Library/LaunchAgents/com.speed_daemon.plist")

    unless File.exist?(launchd_path)
      FileUtils.mkdir(launchd_path)
      FileUtils.touch(error_log_path)
      FileUtils.touch(log_path)
    end

    plist_content = File.read(
      "lib/templates/com.speed_daemon.plist"
    ) % {
      executable_path: executable_path,
      log_path: log_path,
      error_log_path: error_log_path,
      speed_daemon_api_host: speed_daemon_api_host
    }

    File.write(launchd_lib_path, plist_content)

    `launchctl load #{launchd_lib_path}`
  end

  task :uninstall do
    launchd_lib_path = File.join(ENV["HOME"], "Library/LaunchAgents/com.speed_daemon.plist")
    launchd_path = File.expand_path("launchd")

    `launchctl unload #{launchd_lib_path}`

    FileUtils.rm(launchd_lib_path) if File.exist?(launchd_lib_path)
    FileUtils.rm_rf(launchd_path) if File.exist?(launchd_path)
  end
end

task :default => :spec
