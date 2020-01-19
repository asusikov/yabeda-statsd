# frozen_string_literal: true

require "yabeda/statsd/version"
require "yabeda/statsd/adapter"
require "yabeda/statsd/config"
require "yabeda/statsd/tags"

module Yabeda
  # Namespace for Statsd adapter
  module Statsd
    class << self
      def configure(&block)
        class_exec(&block)
      end

      def config
        Yabeda::Statsd::Config.config
      end

      def start(logger: nil)
        connection = ::Datadog::Statsd.new(
          Yabeda::Statsd.config.statsd_host,
          Yabeda::Statsd.config.statsd_port,
          logger: logger,
        )
        adapter = Yabeda::Statsd::Adapter.new(connection: connection)
        Yabeda.register_adapter(:statsd, adapter)
        adapter
      end

      # Start collection metrics from Yabeda collectors
      def start_exporter
        Thread.new do
          loop do
            Yabeda.collectors.each(&:call)
            sleep(config.collect_interval)
          end
        end
      end
    end
  end
end
