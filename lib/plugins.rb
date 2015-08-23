# Plugins management

module Plugins
  def self.parse
    plugins = Array.new
    Dir["./active-plugins/*.rb"].each do |plugin_file|
      require plugin_file
    end
    Plugins.constants.each do |plugin|
      if eval("Plugins::#{plugin}").respond_to?(:run) && eval("Plugins::#{plugin}").respond_to?(:info)
        Printer.print("debug", "Found and loaded working #{plugin} plugin", 3)
        out = eval("Plugins::#{plugin}.info")
        out['class'] = "Plugins::#{plugin}"
        plugins.push(out)
      else
        Printer.print("debug", "Plugin #{plugin} seems to be dead-ish. Ignoring.", 3)
        Plugins.send(:remove_const, plugin)
      end
    end
    return plugins
  end
end