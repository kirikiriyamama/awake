# -*- coding: utf-8 -*-

require 'yaml'


def send_notify(file, application, event, description, priority = NMA::Priority::NORMAL)
  apikey = YAML.load_file(file)['api_key']

  result = NMA.notify do |config|
    config.apikey = apikey
    config.priority = priority
    config.application = application
    config.event = event
    config.description = description
  end

  return result
end
