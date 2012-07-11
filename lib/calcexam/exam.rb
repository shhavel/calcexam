require 'rainbow'

module Calcexam
  class Exam
    attr_reader :answers_count, :right_answers_count

    def initialize
      @answers_count, @right_answers_count = 0, 0
    end

    def right_answer!
      @answers_count += 1
      @right_answers_count += 1
      puts 'Right!'.bright.color(:green)
    end

    def wrong_answer!
      @answers_count += 1
      puts 'Wrong!'.bright.color(:red)
    end

    def try_again
      puts 'Try again'.bright.color(:yellow)
    end

    def results
      mark = (right_answers_count.to_f / [answers_count, 1].max * 100).round(1)
      color = case
      when mark >= 90
        :green
      when mark >= 70
        :blue
      when mark >= 50
        :yellow
      else
        :red
      end
      puts "Results: " + "#{mark}%".bright.color(color) + " (#{right_answers_count}/#{answers_count})".color(color)
    end
  end
end
