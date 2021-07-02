Rails.application.routes.draw do
  root to: "guides#index"
  #Liff
  get 'liff_entry/:base64', to: 'liff#entry'
  get 'liff_entry', to: 'liff#entry'
  post 'liff_route', to: 'liff#route'
  #系統事件
  get "follow", to: "system_events#follow"
  #指南
  get "我想請問", to: "guides#index"
  get "新生引導", to: "guides#junior_index"
  #新生該做的事
  get '設定信箱轉寄', to: "junior#mail_foward"
  get '加入台科大相關社群',to: 'introductions#school_community'
  get '加入新生Line群',to: 'junior#line_community'
  #課務專區
  get '課務',to: 'courses#class_event'
  get '選課規定',to: 'courses#course_rule'
  get '加簽',to: 'courses#add_course'
  get '選課流程',to: 'courses#course_selection_process'
  get '畢業條件',to: 'courses#graduation_requirement'
  get '主修學分',to: 'courses#major_course'
  get '共同必修',to: 'courses#common_requirement'
  get '自由選修',to: 'courses#free_option_course'
  get '雙主/輔系',to: 'courses#double_major_and_minor'
  get '其他系必修',to: 'courses#other_major_required_course'
  get '我的導師是誰',to: 'courses#search_class_teacher'
  get '選課模擬',to: 'courses#course_selection_simulator'
  get '選課常見問題',to: 'courses#faq'
  #校園設施專區
  get '美食',to: 'school_facilities#food_list'
  get '校園地圖',to: 'school_facilities#school_map'
  get '提款機',to: 'school_facilities#ATM'
  get '學餐位置',to: 'school_facilities#school_restaurant'
  get '運動場館',to: 'school_facilities#playground'
  get '影印店',to: 'school_facilities#copy_shop'
  get '剪髮廳',to: 'school_facilities#haircut_shop'
  get '生活用品',to: 'school_facilities#daily_supplies_shop'
  get '校園網路',to: 'school_facilities#network_setup'
  get '校園軟體',to: 'school_facilities#software'
  get '校園運動設施',to: 'school_facilities#playground'
  #介紹專區
  get '校版',to: 'introductions#school_community'
  get '台科大',to: 'introductions#about_ntust'
  get '全校不分系',to: 'introductions#about_inter_disciplinary_bachelors_program'
  get '系上活動',to: 'introductions#inter_disciplinary_bachelors_program_activity'
  get '全校不分系簡介',to: 'introductions#inter_disciplinary_bachelors_program_introduction'
  #社團專區
  get '社團',to: 'categories#index'
  get '(*name)社團(/:page)',to: 'categories#show'
  get '(*name)資訊', to: 'clubs#show'
  resources :categories, only: [:index,:show]
  resources :clubs, only: [:show]
  #獎學金專區
  get '獎學金',to: 'bonuses#scholarship_list'
  #工讀專區
  get '工讀機會',to: 'job_opportunities#part_time_list'
  #未來規劃
  get '未來規劃',to: 'experiences#future_plan'
  get '學姊的經歷',to: 'experiences#senior_experience'
  get '開發者的一段話',to: 'experiences#developer_experience'
  #問題回報
  resources :feedbacks
  #other
  get '*other',to: 'guides#other'
end
