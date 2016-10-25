#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

RULE_FILE = (ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config") + "/xdg-rules"
XDG_OPEN='/usr/bin/xdg-open'
RUN_OPTIONS = {}

def run(program, path)
  spawn("#{program} \"#{path}\"", RUN_OPTIONS)
end

Rule = Struct.new(:regex, :program, :block) do
  def execute(path)
    if block
      path = block.call(path)
    end
    run(program, path) if program
  end
end

class Loader
  attr_reader :commands

  def initialize()
    @commands=[]
  end

  def configure(file)
    ctx = binding()
    eval File.read(file), ctx
  end

  def match(regex, program=false, &block)
      @commands << Rule.new(regex, program, block)
  end

  def open(path)
    rule = @commands.find{|c| c.regex.match path}
    if rule
      rule.execute(path)
    else
      run(XDG_OPEN, path)
    end
  end
end

loader = Loader.new()
loader.configure(RULE_FILE) if File.exist? RULE_FILE
ARGV.each do |path|
  pid = loader.open(path)
  Process.detach(pid) if pid
end
