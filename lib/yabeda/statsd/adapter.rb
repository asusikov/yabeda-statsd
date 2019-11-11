# frozen_string_literal: true

require 'yabeda/base_adapter'
require 'datadog/statsd'

module Yabeda
  module Statsd
    # Adapter for statsd
    class Adapter < BaseAdapter
      attr_reader :dogstatsd

      def initialize(logger: nil)
        @dogstatsd = ::Datadog::Statsd.new(
          Yabeda::Statsd.config.statsd_host,
          Yabeda::Statsd.config.statsd_port,
          logger: logger
        )
      end

      def register_counter!(_)
        # We don't need to register metric
      end

      def perform_counter_increment!(counter, tags, increment)
        tags = Yabeda::Statsd::Tags.build(tags)
        dogstatsd.increment(build_name(counter), by: increment, tags: tags)
      end

      def register_gauge!(_)
        # We don't need to register metric
      end

      def perform_gauge_set!(gauge, tags, value)
        tags = Yabeda::Statsd::Tags.build(tags)
        dogstatsd.gauge(build_name(gauge), value, tags: tags)
      end

      def register_histogram!(_)
        # We don't need to register metric
      end

      def perform_histogram_measure!(historam, tags, value)
        tags = Yabeda::Statsd::Tags.build(tags)
        dogstatsd.histogram(build_name(historam), value, tags: tags)
      end

      private

      def build_name(metric)
        [metric.group, metric.name, metric.unit].compact.join('_').to_sym
      end
    end
  end
end
