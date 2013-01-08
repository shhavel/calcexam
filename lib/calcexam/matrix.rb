module Calcexam
  class Matrix
    include Enumerable
    attr_reader :operation, :x, :y

    def initialize(operation=:*, x=[], y=[])
      @operation = operation
      @x, @y = parse_interval(x), parse_interval(y)
      @do_shuffle = false
    end

    def each
      idxs = (0..(@x.size * @y.size - 1).to_i).to_a
      idxs.shuffle! if @do_shuffle
      idxs.each do |idx|
        yield self[idx]
      end
    end

    def shuffle!
      @do_shuffle = true
      self
    end

    def unshuffle!
      @do_shuffle = false
      self
    end

    def size
      @x.size * @y.size
    end

    def [](i, j=nil)
      if j.nil?
        j = i / @x.size
        i = i % @x.size
      end
      [@x[i], @y[j]]
    end

    private
    def parse_interval(interval)
      case
      when interval.respond_to?(:to_a)
        interval.to_a
      when interval.is_a?(String) && m = /^(\d+)\.\.(\d+)$/.match(interval)
        (m[1].to_i..m[2].to_i).to_a
      when interval.is_a?(String) && interval =~ /^\d+\s*(,\s*\d+)+$/
        interval.split(',').map(&:to_i)
      else
        [interval.to_i]
      end
    end
  end
end
