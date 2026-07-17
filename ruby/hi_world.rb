#!/usr/bin/env ruby

class WorldGreeter
    attr_accessor :names

    def initialize(name="World")
        @names=names
    end

    def say_hi
        if @names.nil?
            puts "..."
        elsif @names.respond_to?("each")
            @names.each do |name|
                puts "Hello #{name}!"
            end
        else
            puts "Hello #{@names}!"
        end
    end

    def say_bye
        if @names.nil?
            puts "..."
        elsif @names.respond_to?("join")
            puts "Goodbye #{@names.join(", ")}. Come back soon!"
        else
            puts "Goodbye #{@names}. Come back soon!"
        end
    end
end

if __FILE__ == $0
    wg=WorldGreeter.new
    wg.say_hi
    wg.say_bye

    wg.names="Epstein"
    wg.say_hi
    wg.say_bye

    wg.names=["Trump","Diddy","Netanyahu","Epstein"]
    wg.say_hi
    wg.say_bye

    wg.names=nil
    wg.say_hi
    wg.say_bye
end
