# frozen_string_literal: true

module Yabeda
  module Statsd
    # = The logic of working with Datadog tags
    class Tags
      def self.build(tags)
        map_labels = ->(key, value) { "#{key}:#{value}" }
        global_labels = Yabeda::Statsd.global_labels.map(&map_labels)
        tags = tags.map(&map_labels)
        global_labels + tags
      end
    end
  end
end
