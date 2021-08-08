class GetGithubReleases
  def perform
    response = Faraday.get("https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases")
    JSON.parse response.body
  end
end