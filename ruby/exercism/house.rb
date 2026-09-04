#!/usr/bin/env ruby

class House
  OBJECTS = ['house that Jack built', 'malt', 'rat', 'cat', 'dog', 'cow with the crumpled horn', 'maiden all forlorn', 'man all tattered and torn', 'priest all shaven and shorn', 'rooster that crowed in the morn', 'farmer sowing his corn', 'horse and the hound and the horn'].freeze

  CLAUSES = {
    1 => 'lay in',
    2 => 'ate',
    3 => 'killed',
    4 => 'worried',
    5 => 'tossed',
    6 => 'milked',
    7 => 'kissed',
    8 => 'married',
    9 => 'woke',
    10 => 'kept',
    11 => 'belonged to'
  }.freeze

  def self.recite(start, stop)
    result = ''
    while start <= stop
      result << "#{paragraph(start)}\n"
      start += 1
    end
    result
  end

  def self.paragraph(count)
    subject = OBJECTS[count - 1]
    result = "This is the #{subject}"
    while count >= 2
      count -= 1
      result << " that #{CLAUSES[count]} the #{OBJECTS[count - 1]}"
    end
    "#{result}."
  end
end