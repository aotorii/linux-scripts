#!/usr/bin/env ruby

class Nucleotide
  def initialize(strand)
    @strand = strand
  end

  def self.from_dna(strand)
    raise ArgumentError unless strand.match?(/\A[ACGT]*\z/)

    Nucleotide.new(strand)
  end

  def histogram
    {
      'A' => @strand.count('A'),
      'T' => @strand.count('T'),
      'C' => @strand.count('C'),
      'G' => @strand.count('G')
    }
  end
end