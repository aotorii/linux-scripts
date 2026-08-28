#!/usr/bin/env ruby

class Dominoes
  def self.chain?(dominoes)
    return true if dominoes.empty?

    degree = Hash.new(0)
    graph = Hash.new { |h, k| h[k] = [] }
    dominoes.each do |a, b|
      degree[a] += 1
      degree[b] += 1
      graph[a] << b
      graph[b] << a
    end

    return false unless degree.values.count(&:odd?).zero?

    start = degree.keys.first
    visited = {}
    dfs = lambda do |node|
      visited[node] = true
      graph[node].each do |next_node|
        dfs.call(next_node) unless visited[next_node]
      end
    end
    dfs.call(start)
    degree.keys.all? { |k| visited[k] }
  end
end