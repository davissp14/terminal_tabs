require "./terminal_jobs/tab"
require "test/unit"

class TabTest < Test::Unit::TestCase
  def setup
    hash = {"local_runner" => "/Users/shaun/Programming/mongohq/probe-server"}
    @tab = Tab.new(hash)
  end
  
  def test_initialize
    assert_equal("local_runner", @tab.name, "Name does not match.")
    assert_equal("/Users/shaun/Programming/mongohq/probe-server", @tab.directive, "Directive does not match.")
  end
  
end