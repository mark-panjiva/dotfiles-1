begin
    require "rubygems"
    require 'awesome_print'
    AwesomePrint.pry!
      Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
    puts "no awesome_print :("
end
