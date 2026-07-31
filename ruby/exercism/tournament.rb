#!/usr/bin/env ruby

class Tournament
  WIN = { MP: 1, W: 1, D: 0, L: 0, P: 3 }.freeze
  LOSS = { MP: 1, W: 0, D: 0, L: 1, P: 0 }.freeze
  DRAW = { MP: 1, W: 0, D: 1, L: 0, P: 1 }.freeze
  INIT = { MP: 0, W: 0, D: 0, L: 0, P: 0 }.freeze
  def self.tally(input)
    table = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY
    teams = {}
    input.each_line do |line|
      *temp, result = line.chomp.split(';')
      temp.each do |team|
        teams[team] = INIT.dup unless teams.include?(team)
      end
      case result
      when 'win'
        update(teams[temp[0]], WIN)
        update(teams[temp[1]], LOSS)
      when 'loss'
        update(teams[temp[1]], WIN)
        update(teams[temp[0]], LOSS)
      when 'draw'
        update(teams[temp[0]], DRAW)
        update(teams[temp[1]], DRAW)
      end
    end
    teams.sort_by { |k, v| [-v[:P], k] }.to_h.each do |k, v|
      entries = [k.ljust(30)] + %i[MP W D L P].map { |k| parse(v[k]) }
      table << entries.join(' | ') << "\n"
    end
    table
  end

  def self.parse(num)
    num.to_s.rjust(2)
  end

  def self.update(dict_1, dict_2)
    dict_1.each_key do |key|
      dict_1[key] += dict_2[key]
    end
  end
end