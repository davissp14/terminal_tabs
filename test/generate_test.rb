require "./terminal_jobs/generate"
require "test/unit"
require 'yaml'

class TestGenerate < Test::Unit::TestCase
  def setup
    @gen = Generate.new
  end
  
  def test_initialize
    assert_equal("Terminal", @gen.app)
  end
  
end