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

  def first_widget_fails
    Widget.first
  end

  def first_widget_passes
    YAML.dump Widget.first
  end
end
