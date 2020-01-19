# frozen_string_literal: true

require "dry-configurable"

module Yabeda
  module Statsd
    # Configuration of connection to server and collecting of metrics
    class Config
      extend Dry::Configurable

      SECOND = 1
      COLLECT_INTERVAL = 60 * SECOND

      setting :statsd_host
      setting :statsd_port, "9125"
      setting :collect_interval, COLLECT_INTERVAL
    end
  end
end
