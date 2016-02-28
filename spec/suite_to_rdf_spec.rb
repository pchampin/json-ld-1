# coding: utf-8
$:.unshift "."
require 'spec_helper'

describe JSON::LD do
  describe "test suite" do
    require 'suite_helper'
    m = Fixtures::SuiteTest::Manifest.open("#{Fixtures::SuiteTest::SUITE}tests/toRdf-manifest.jsonld")
    describe m.name do
      m.entries.each do |t|
        specify "#{t.property('input')}: #{t.name}#{' (negative test)' unless t.positiveTest?}" do
          skip "Native value fidelity" if %w(toRdf-0035-in.jsonld).include?(t.property('input'))
          pending "Generalized RDF" if %w(toRdf-0118-in.jsonld).include?(t.property('input'))
          pending "Blank nodes with reverse properties" if %w(toRdf-0119-in.jsonld).include?(t.property('input'))
          t.run self
        end
      end
    end
  end
end unless ENV['CI']