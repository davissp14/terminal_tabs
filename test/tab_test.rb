require "./terminal_jobs/tab"
require "test/unit"

class TabTest < Test::Unit::TestCase
  def setup
    hash = {"local_runner" => "/Users/shaun/Programming/mongohq/probe-server"}
    @tab = Tab.new(hash)
  end
  
  def test_initialize
    assert_equal("local_runner", @tab.name)
  end
  
end