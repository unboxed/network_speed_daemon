# Speed Daemon

An unboxed hackday project to measure download speed. The results are posted to
an [API](https://github.com/unboxed/network_speed) to be displayed on our
[dashboard](https://github.com/unboxed/dashboard).

This gem provides a `daemon` executable that sends metrics up to the API and a rake
task to install/uninstall this as a [launchd](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)

## Usage

Set `SPEED_DAEMON_API_HOST` in your env.

```
gem build speed-daemon.gemspec
gem install speed-daemon-0.1.0.gem
rake nsd:install
rake nsd:uninstall
```
