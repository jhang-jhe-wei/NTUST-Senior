class ParseCrosslink
  def initialize(url, semester = 1101)
    Capybara.default_max_wait_time = 1
    Capybara.default_driver = :selenium_chrome_headless
    @semester = semester
    @url = url
  end

  def perform
    courses = []
    @b = Capybara.current_session
    @b.visit("#{@url}/timetable/#{@semester}")
    course_urls = @b.all("a.course-name").map do |url|
      url["href"]
    end.uniq
    course_urls.each do |url|
      @b.visit(url)
      courses << {
        name: @b.find("h1")["textContent"],
        semester: @b.all("tr")[1].all("td")[1]["textContent"],
        sections: @b.all("td div").map { |s| s["textContent"] },
        url: url,
      }
    end
    Capybara.current_session.driver.quit
    courses
  end
end
