# Prompt with ruby version
#Pry.config.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

#if defined?(PryRails::RAILS_PROMPT)
#  Pry.config.prompt = PryRails::RAILS_PROMPT
#end

require "amazing_print"
AmazingPrint.pry!

# Toys methods
# See https://gist.github.com/807492
#def Array.toy(n=10, &block)
#  block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
#end

