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
          name: course_name,
          school: course_school,
          semester: course_semester,
          course_times: course_times,
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

  def course_name
    @b.find("h1")["textContent"]
  end

  def course_semester
    @b.all("tr")[1].all("td")[1]["textContent"]
  end

  def course_times
    @b.all("td div").map do |s|
      CourseTime.create(
        section: s["textContent"],
        place: get_course_place(s["textContent"])
      )
    end
  end

  def get_course_place(course_time)
    matched_place = course_places.find {|place| place.match /#{get_code(course_time)}/}
    return nil if matched_place.nil?
    return matched_place.match(/.*\((?<place>.*)\)/)[:place]
  end

  def course_places
    @b.all("tr")[5].all("td")[1].text.split(',')
  end

  def course_school
    @b.all("tr")[0].all("td")[1]["textContent"]
  end

  def get_code(course_time)
    return get_weekdate_code(course_time) + get_section_code(course_time)
  end

  def get_weekdate_code(course_time)
    case course_time
    when /週一/
      return 'M'
    when /週二/
      return 'T'
    when /週三/
      return 'W'
    when /週四/
      return 'R'
    when /週五/
      return 'F'
    when /週六/
      return 'S'
    end
  end

  def get_section_code(course_time)
    case course_time
    when /07:10-08:00/
      return '0'
    when /08:10-09:00/
      return '1'
    when /09:10-10:00/
      return '2'
    when /10:20-11:10/
      return '3'
    when /11:20-12:10/
      return '4'
    when /12:20-13:10/
      return '5'
    when /13:20-14:10/
      return '6'
    when /14:20-15:10/
      return '7'
    when /15:30-16:20/
      return '8'
    when /16:30-17:20/
      return '9'
    when /17:30-18:20/
      return '10'
    when /18:25-19:15/
      return 'A'
    when /19:20-20:10/
      return 'B'
    when /20:15-21:05/
      return 'C'
    when /21:10-22:00/
      return 'D'
    end
  end
end
