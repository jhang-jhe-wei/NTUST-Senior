Rails.application.routes.draw do
  root to: "direction#index"
  get "follow", to: "event#follow"
  get "我想請問", to: "direction#index"
  #課務專區
  get '課務',to: 'direction#class_event'
  get '選課',to: 'direction#course_selection'
  get '加簽',to: 'direction#add_course'
  get '選課流程',to: 'direction#course_selection_process'
  get '畢業條件',to: 'direction#graduation_requirement'
  get '專業選/必修',to: 'direction#major_course'
  get '共同必修',to: 'direction#common_requirement'
  get '自由選修',to: 'direction#free_option_course'
  get '雙主/輔系',to: 'direction#double_major_and_minor'
  get '其他系必修',to: 'direction#other_major_required_course'
  get '導師如何查詢',to: 'direction#search_class_teacher'
  #學校專區
  get '台科大',to: 'direction#about_ntust'
  get '校版',to: 'direction#school_community'
  get '美食',to: 'direction#food_list'
  get '校園地圖',to: 'direction#school_map'
  get '學餐位置',to: 'direction#school_restaurant'
  get '運動場館',to: 'direction#playground'
  get '影印店',to: 'direction#copy_shop'
  get '剪髮廳',to: 'direction#haircut_shop'
  get '生活用品',to: 'direction#daily_supplies_shop'
  #全校不分系專區
  get '全校不分系',to: 'direction#about_inter_disciplinary_bachelors_program'
  get '系上活動',to: 'direction#inter_disciplinary_bachelors_program_activity'
  get '全校不分系簡介',to: 'direction#inter_disciplinary_bachelors_program_introduction'
  #社團專區
  get '社團',to: 'direction#club_list'
  #獎學金專區
  get '獎學金',to: 'direction#scholarship_list'
  #工讀專區
  get '工讀機會',to: 'direction#part_time_list'
  #未來規劃
  get '未來規劃',to: 'direction#future_plan'
  get '學姊的經歷',to: 'direction#senior_experience'
  get '開發者的一段話',to: 'direction#developer_experience'
  
end
