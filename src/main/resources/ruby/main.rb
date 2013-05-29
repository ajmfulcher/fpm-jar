#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "..", "lib")

dirs = Dir.glob File.join(File.dirname(__FILE__),"gems","*","lib")
dirs.each{|dir| $LOAD_PATH.unshift dir}

require "fpm"
require "fpm/command"

module Gem
  def self.dir
    `dirname $(gem which rubygems)`.chomp
  end
end

(FPM::Command.run || 0)
