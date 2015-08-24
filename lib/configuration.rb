# Configuration module

module Configuration
  def self.parse
    $params['access_token'] == nil ? github_access_token = ENV['GITHUB_MANAGER_API_TOKEN'] : github_access_token = $params.access_token
    if github_access_token.nil?
      Printer.print("error", "Github access token env variable is not set.")
    else self.check_connection(github_access_token)
    end
  end

  def self.check_connection(github_access_token)
    client = Octokit::Client.new(:access_token => github_access_token)
    if client
      $connection = client
    else
      Printer.print("error", "Problem with connectivity? Check if your token is still active.")
    end
  end
end