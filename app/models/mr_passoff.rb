class MrPassoff
  def initialize(widget)
    @widget_id = widget.id
    @widget_name = widget.name
  end

  def process
    @result = "Passed off #{widget_name} without touching database"
  end

  def finalize
    p "Got back result for #{widget} - #{result}"
  end

  private

  attr_reader :widget_id, :widget_name, :result

  def widget
    @widget ||= Widget.find(widget_id)
  end
end
