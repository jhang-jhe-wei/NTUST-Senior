require 'rails_helper'

RSpec.describe "Notifies", type: :request do

  let(:github_releases) {
    [
      {
        "url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/47201812",
        "assets_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/47201812/assets",
        "upload_url"=>"https://uploads.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/47201812/assets{?name,label}",
        "html_url"=>"https://github.com/jhang-jhe-wei/NTUST-Senior/releases/tag/0.3.0",
        "id"=>47201812,
        "author"=>{
          "login"=>"jhang-jhe-wei",
          "url"=>"https://api.github.com/users/jhang-jhe-wei",
          "html_url"=>"https://github.com/jhang-jhe-wei",
          "followers_url"=>"https://api.github.com/users/jhang-jhe-wei/followers",
          "following_url"=>"https://api.github.com/users/jhang-jhe-wei/following{/other_user}",
          "gists_url"=>"https://api.github.com/users/jhang-jhe-wei/gists{/gist_id}",
          "starred_url"=>"https://api.github.com/users/jhang-jhe-wei/starred{/owner}{/repo}",
          "subscriptions_url"=>"https://api.github.com/users/jhang-jhe-wei/subscriptions",
          "organizations_url"=>"https://api.github.com/users/jhang-jhe-wei/orgs",
          "repos_url"=>"https://api.github.com/users/jhang-jhe-wei/repos",
          "events_url"=>"https://api.github.com/users/jhang-jhe-wei/events{/privacy}",
          "received_events_url"=>"https://api.github.com/users/jhang-jhe-wei/received_events",
          "type"=>"User", "site_admin"=>false
        },
        "node_id"=>"MDc6UmVsZWFzZTQ3MjAxODEy",
        "tag_name"=>"0.3.0", "target_commitish"=>"master", "name"=>"", "draft"=>false,
        "prerelease"=>false, "created_at"=>"2021-08-03T06:49:34Z", "published_at"=>"2021-08-03T06:52:15Z",
        "assets"=>[], "tarball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/tarball/0.3.0",
        "zipball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/zipball/0.3.0",
        "body"=>"# 新增功能\r\n- 台科大行事曆訂閱\r\n"
      },
      {
        "url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46707760", "assets_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46707760/assets", "upload_url"=>"https://uploads.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46707760/assets{?name,label}", "html_url"=>"https://github.com/jhang-jhe-wei/NTUST-Senior/releases/tag/0.2.0", "id"=>46707760, "author"=>{"login"=>"jhang-jhe-wei", "id"=>59594475, "node_id"=>"MDQ6VXNlcjU5NTk0NDc1", "avatar_url"=>"https://avatars.githubusercontent.com/u/59594475?v=4", "gravatar_id"=>"", "url"=>"https://api.github.com/users/jhang-jhe-wei", "html_url"=>"https://github.com/jhang-jhe-wei", "followers_url"=>"https://api.github.com/users/jhang-jhe-wei/followers", "following_url"=>"https://api.github.com/users/jhang-jhe-wei/following{/other_user}", "gists_url"=>"https://api.github.com/users/jhang-jhe-wei/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/jhang-jhe-wei/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/jhang-jhe-wei/subscriptions", "organizations_url"=>"https://api.github.com/users/jhang-jhe-wei/orgs", "repos_url"=>"https://api.github.com/users/jhang-jhe-wei/repos", "events_url"=>"https://api.github.com/users/jhang-jhe-wei/events{/privacy}", "received_events_url"=>"https://api.github.com/users/jhang-jhe-wei/received_events", "type"=>"User", "site_admin"=>false}, "node_id"=>"MDc6UmVsZWFzZTQ2NzA3NzYw", "tag_name"=>"0.2.0", "target_commitish"=>"master", "name"=>"", "draft"=>false, "prerelease"=>false, "created_at"=>"2021-07-23T09:03:47Z", "published_at"=>"2021-07-24T03:17:18Z", "assets"=>[], "tarball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/tarball/0.2.0", "zipball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/zipball/0.2.0", "body"=>"# 新增功能\r\n- 版本更新通知"}, {"url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46385315", "assets_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46385315/assets", "upload_url"=>"https://uploads.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases/46385315/assets{?name,label}", "html_url"=>"https://github.com/jhang-jhe-wei/NTUST-Senior/releases/tag/0.1.0", "id"=>46385315, "author"=>{"login"=>"jhang-jhe-wei", "id"=>59594475, "node_id"=>"MDQ6VXNlcjU5NTk0NDc1", "avatar_url"=>"https://avatars.githubusercontent.com/u/59594475?v=4", "gravatar_id"=>"", "url"=>"https://api.github.com/users/jhang-jhe-wei", "html_url"=>"https://github.com/jhang-jhe-wei", "followers_url"=>"https://api.github.com/users/jhang-jhe-wei/followers", "following_url"=>"https://api.github.com/users/jhang-jhe-wei/following{/other_user}", "gists_url"=>"https://api.github.com/users/jhang-jhe-wei/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/jhang-jhe-wei/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/jhang-jhe-wei/subscriptions", "organizations_url"=>"https://api.github.com/users/jhang-jhe-wei/orgs", "repos_url"=>"https://api.github.com/users/jhang-jhe-wei/repos", "events_url"=>"https://api.github.com/users/jhang-jhe-wei/events{/privacy}", "received_events_url"=>"https://api.github.com/users/jhang-jhe-wei/received_events", "type"=>"User", "site_admin"=>false}, "node_id"=>"MDc6UmVsZWFzZTQ2Mzg1MzE1", "tag_name"=>"0.1.0", "target_commitish"=>"master", "name"=>"", "draft"=>false, "prerelease"=>false, "created_at"=>"2021-07-19T02:15:16Z", "published_at"=>"2021-07-19T02:20:23Z", "assets"=>[], "tarball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/tarball/0.1.0", "zipball_url"=>"https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/zipball/0.1.0", "body"=>"# 台科不分系學姊第一版\r\n新增功能：\r\n- 新生引導\r\n- 我想請問\r\n- 通知服務\r\n- 問題回報"
      }
    ]
  }

  describe "GET /notifies" do
    it "works! (now write some real specs)" do
      headers = {
        'HTTP_AUTHORIZATION': ActionController::HttpAuthentication::Basic.encode_credentials(ENV["HTTP_AUTH_USERNAME"], ENV["HTTP_AUTH_PASSWORD"])
      }

      expect_any_instance_of(GetGithubReleases).to receive(:perform).and_return(github_releases)
      expect(LineNotify).to receive(:send).with(nil, message: "\n\n版本更新通知\n\n💎 最新版本號：0.3.0\n\n本次更新內容為以下：\n\n📋 新增功能\r\n📌 台科大行事曆訂閱\r\n")
      Subscription.create(notify_type: "版本更新通知", user: User.create)
      post "/notifies/version", headers: headers
      expect(response).to have_http_status(302)
    end
  end
end
