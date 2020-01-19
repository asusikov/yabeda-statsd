# frozen_string_literal: true

RSpec.describe Yabeda::Statsd::Tags do
  describe ".build" do
    subject { described_class.build(tags) }

    let(:tags) { { foo: "bar", bar: "foo" } }

    it { is_expected.to eq(["foo:bar", "bar:foo"]) }
  end
end
