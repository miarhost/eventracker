require_dependency 'eventracker_hook_listener'

Redmine::Plugin.register :eventracker do
  name 'Eventracker plugin'
  author 'miarhost'
  description 'This is a plugin for Redmine. It tracks an event and patches changes on a page'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/miarhost/eventracker/README.git'
end
