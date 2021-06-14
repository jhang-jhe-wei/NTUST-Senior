class ReloadClub
  def initialize
    Capybara.default_max_wait_time = 1
    Capybara.default_driver = :selenium_chrome_headless
  end

  def perform
    @b = Capybara.current_session
    Category.destroy_all
    colors = ["#FED766", "#FE4A49", "#7AE582", "#25A18E", "#13A3AF", "#00A5CF", "#004E64"]
    get_club_groups.each do |key, values|
      category = Category.find_by(name: key) || Category.create!(name: key, color: colors[Category.count])
      values.each do |value|
        load_club(category, value[:club_url])
      end
    end
    @b.quit
  end

  private

  def load_club(category, url)
    @b.visit(url)
    tds = @b.all("table").first.all("td")
    Club.create!(
      name: tds[1].text,
      leader: tds[3].text,
      teacher: tds[5].text,
      intro: tds[7].text,
      url: tds[9].text || url,
      updated_date: tds[11].text,
      category_id: category.id,
    )
  end

  def get_club_urls
    @b.visit("http://clubs.ntust.edu.tw/Introduction/")
    @b.all(".well a").map do |a|
      a["href"]
    end
  end

  def get_club_groups
    @b.visit("http://clubs.ntust.edu.tw/Introduction/")
    club_group_key = ""
    club_groups = {}
    @b.all(".well td").each do |td|
      if td["colspan"] == "3"
        # 社團分類名
        club_group_key = td.text
      else
        # 社團名
        club_groups[club_group_key] ||= []
        club_groups[club_group_key] << {
          club_name: td.text,
          club_url: td.find("a")["href"],
        }
      end
    end
    club_groups
  end
end
