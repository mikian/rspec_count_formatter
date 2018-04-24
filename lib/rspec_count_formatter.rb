require 'rspec/core'
require 'rspec/core/formatters/base_text_formatter'

class RspecCountFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self,
                                   :example_failed,
                                   :example_passed,
                                   :example_pending,
                                   :start

  def start(notification)
    @total   = notification.count
    @passed  = 0
    @pending = 0
    @failed  = 0
  end

  def example_passed(notification)
    @passed += 1

    status(notification.example.id)
  end

  def example_pending(notification)
    @pending += 1

    status(notification.example.id)
  end

  def example_failed(notification)
    @failed += 1

    output.puts notification.fully_formatted(@failed)
    output.puts

    status(notification.example.id)
  end

  private

  def status(example)
    done = (@passed + @pending + @failed)
    @width ||= @total.to_s.length

    output.puts format("%#{@width}<done>d / %#{@width}<total>d: %<example>s",
                       done: done, total: @total, example: example)
  end
end
