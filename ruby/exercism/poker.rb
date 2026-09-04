#!/usr/bin/env ruby

class Poker
  def initialize(hands)
    @hands = hands
  end

  def best_hand
    hands = @hands.map { |hand| Hand.new(hand) }
    max = hands.max
    hands.select { |hand| hand == max }.map(&:hand)
  end
end

class Hand
  include Comparable

  CARD_RANK = (%w[A K Q J] + (2..10).to_a.reverse.map(&:to_s)).each_with_index.to_h { |x, i| [x, i + 1] }.freeze

  HAND_RANK = [[4, 1], [3, 2], [3, 1, 1], [2, 2, 1], [2, 1, 1, 1], [1, 1, 1, 1, 1]].each_with_index.to_h { |x, i| [x, i + 1] }.freeze

  def initialize(hand)
    @hand = hand
    @rank = HAND_RANK[hand.map(&:chop).tally.sort_by { |_, count| -count }.to_h.values]
    @ranks = normalize(hand.map { |c| CARD_RANK[c.chop] }.tally.sort_by { |rank, count| [-count, rank] }.flat_map { |rank, count| [rank] * count })
  end

  attr_reader :hand, :rank, :ranks

  def <=>(other)
    case
    when straight_flush?
      return other.ranks <=> @ranks if other.straight_flush?

      1
    when flush?
      return -1 if other.straight_flush?
      return other.ranks <=> @ranks if other.flush?

      other.rank > 2 ? 1 : -1
    when straight?
      return -1 if other.flush?
      return other.ranks <=> @ranks if other.straight?

      other.rank > 2 ? 1 : -1
    when rank <= 2 && other.straight_flush?
      -1
    when rank > 2 && (other.straight? || other.flush?)
      -1
    else
      return other.ranks <=> @ranks if rank == other.rank

      other.rank <=> rank
    end
  end

  def flush?
    @hand.map { |c| c[-1] }.uniq.size == 1
  end

  def straight?
    @ranks.sort == (@ranks.min..@ranks.max).to_a
  end

  def normalize(ranks)
    return (10..14).to_a if ranks == [1, 10, 11, 12, 13]

    ranks
  end

  def straight_flush?
    flush? && straight?
  end
end