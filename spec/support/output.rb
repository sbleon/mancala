module OutputDummy

  class Output
    def messages
      @messages ||= []
    end

    def puts(message)
      messages << message
    end
  end

  def output
    @output ||= Output.new
  end

end