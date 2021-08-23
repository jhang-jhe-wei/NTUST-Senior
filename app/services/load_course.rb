class LoadCourse
  def initialize(user, semester = 1101)
    Capybara.default_max_wait_time = 1
    Capybara.default_driver = :selenium_chrome_headless
    @semester = semester
    @user = user
    @user.courses.clear
  end

  def perform    
    course_urls.each do |url|
      @b.visit(url)
      course = Course.find_by(url: url)
      unless course
        course = Course.create!({
          name: @b.find("h1")["textContent"],
          semester: @b.all("tr")[1].all("td")[1]["textContent"],
          course_times: @b.all("td div").map { |s| CourseTime.create(section: s["textContent"])},
          url: url,
        })
      end
      @user.courses << course
    end
    Capybara.current_session.driver.quit
  end
  private

  def course_urls
    @b = Capybara.current_session
    @b.visit("#{@user.crosslink_url}/timetable/#{@semester}")
    course_urls = @b.all("a.course-name").map do |url|
      url["href"]
    end.uniq
  end
end
