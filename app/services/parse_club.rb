class ReloadClub

  def initialize
    Capybara.default_max_wait_time = 1
    Capybara.default_driver = :selenium_chrome
  end
  
  def perform
    @b = Capybara.current_session
    club_datas = get_club_urls.map do |url|
      get_club_data(url)
    end
    @b.quit
    puts club_datas
    Club.delete_all
    
  end
  
  private
  def get_club_data(url)
    @b.visit(url)
    tds = @b.all('table').first.all('td')
    # 0: 社團名稱：
    # 1: 鋼琴社
    # 2: 社長姓名：
    # 3: 楊嘉輝
    # 4: 指導老師：
    # 5: 蘇金輝 謝沛芷
    # 6: 社團簡介：
    # 7: 踏入校園，緩緩的走著，百花綻放，猶如《花舞》般紛飛的花兒迎接我們。在社團大樓底下，買了一杯《抹茶拿鐵》，走上階梯。一步一步，聽到那《黑鍵》的奇妙，牽伴著白鍵的柔和，徜徉在優美的旋律中，《夢幻曲》便已響起！在充滿精靈的《田園》裡唱著歌，《乘著歌聲的翅膀》一路翱翔。落霞殘照，夜幕低垂，《純白》的《月光》灑落，幻似《英雄》守護著社團大樓的每個角落。望著佇立在社辦的鋼琴，彷彿《命運》要讓我們相遇，伴隨《四季》的變換，讓《十億光年的距離》更加縮短，創造屬於我們的家，屬於我們的《第三樂章》！!
    # 8: 社團網頁：
    # 9: https://www.facebook.com/NtustPianoClub
    # 10: 上次更新日期：
    # 11: 2021年3月21日
    {
      club_name: tds[1].text,
      leader_name: tds[3].text,
      teacher_name: tds[5].text,
      introduction: tds[7].text,
      url: tds[9].text,
      updated_date: tds[11].text
    }
  end
  
  def get_club_urls
    @b.visit("http://clubs.ntust.edu.tw/Introduction/")
    @b.all('.well a').map do |a|
      a["href"]
    end
  end
  
  def get_club_groups
    @b.visit("http://clubs.ntust.edu.tw/Introduction/")
    club_group_key = ""
    club_groups = {}
    @b.all('.well td').each do |td|
      if td["colspan"] == "3"
        # 社團分類名
        club_group_key = td.text
      else
        # 社團名
        club_groups[club_group_key] ||= []
        club_groups[club_group_key] << {
          club_name: td.text,
          club_url: td.find("a")["href"]
        }
      end
    end
    club_groups
  end
  end