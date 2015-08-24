# Parameters module

require 'trollop'

module Parameters
  def self.parse
    $plugin = Plugins.parse
    $opts = Trollop::options do
      $plugin.each do |p|
        opt p['handle'].to_sym, p['description'], :type => p['type'].to_sym
      end
      opt :debug, "Debug mode level", :type => :integer, :default => 0
      opt :access_token, "Github access token", :type => :string, :default => nil
    end
    $debug = $opts.debug.to_i
    return $opts
  end

  def self.act
    specified_parameters = $params.select { |key, value| key.to_s.match(/^.*_given$/) }
    specified_parameters.each do |single_parameter|
      plugin_to_run = single_parameter[0].to_s.gsub("_given", "")
      $plugin.each do |p|
        if plugin_to_run == p['handle']
          Printer.print('debug', "Running plugin #{p['handle']} on request", 5)
          eval(p['class']).run
        end
      end
    end
  end
end