require 'pry'
# Initial data
graph = {
  book: {
    rare_lp: 5,
    poster: 0
  },
  poster: {
    drum_set: 35,
    bass_guitar: 30
  },
  rare_lp: {
    drum_set: 20,
    bass_guitar: 15
  },
  bass_guitar: {
    piano: 20
  },
  drum_set: {
    piano: 10
  }
}

# Start and finish
start = :book
finish = :piano

class InvalidStartNode < StandardError; end

class DijkstraSolver
  def initialize(graph)
    @graph = graph
  end

  def solve(start, finish)
    raise InvalidStartNode if (
      @graph[start].nil? ||
      @graph[start].empty?
    )

    costs = Hash.new(Float::INFINITY)
    parents = {}
    processed = []

    @graph[start].each do |node, weight|
      costs[node] = weight
      parents[node] = start
    end

    costs[finish] = Float::INFINITY
    parents[finish] = nil

    node = find_lowest_cost_node(costs, processed)

    puts "DEBUGGING ===================="

    until node.nil?
      puts "costs: #{costs}"
      puts "parents: #{parents}"
      puts "processed: #{processed}"
      puts "node: #{node}"
      puts "=============================="
      cost = costs[node]
      neighbors = @graph[node]
      unless neighbors.nil?
        neighbors.each do |neighbor, weight|
          new_cost = cost + weight
          if costs[neighbor] > new_cost
            costs[neighbor] = new_cost
            parents[neighbor] = node
          end
        end
      end
      processed << node
      node = find_lowest_cost_node(costs, processed)
    end
  end

  def find_lowest_cost_node(costs, processed)
    lowest_cost_node = nil
    lowest_cost = Float::INFINITY

    costs.each do |node, cost|
      if !processed.include?(node) && cost < lowest_cost
        lowest_cost = cost
        lowest_cost_node = node
      end
    end

    return lowest_cost_node
  end
end

DijkstraSolver.new(graph).solve(start, finish)
