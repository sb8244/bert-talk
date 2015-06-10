module WithRails
  def hello
    "world"
  end

  def add_widget(name)
    Widget.create!(name: name)
    true
  end

  def widget_count
    Widget.count
  end
end
