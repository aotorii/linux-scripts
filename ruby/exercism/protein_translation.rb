#!/usr/bin/env ruby

class InvalidCodonError < StandardError
end

class Translation
  AMINO = {
    ['AUG'] => 'Methionine',
    %w[UUU UUC] => 'Phenylalanine',
    %w[UUA UUG] =>	'Leucine',
    %w[UCU UCC UCA UCG] =>	'Serine',
    %w[UAU UAC] =>	'Tyrosine',
    %w[UGU UGC] =>	'Cysteine',
    ['UGG'] =>	'Tryptophan'
  }.flat_map do |codons, amino|
    codons.map { |codon| [codon, amino] }
  end.to_h.freeze

  CODON = AMINO.keys.freeze

  def self.of_rna(strand)
    return [] if strand.empty?

    result = []
    strand.chars.each_slice(3).map(&:join).each do |c|
      return result if %w[UAA UAG UGA].include?(c)

      raise InvalidCodonError unless CODON.include?(c) && c.size == 3

      result << AMINO[c]
    end
    result
  end
end