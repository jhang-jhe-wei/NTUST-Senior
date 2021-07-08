# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Notify.create(name: "版本更新通知", intro: "訂閱後有關於版本的更新都會通知你哦！") unless Notify.find_by(name: "版本更新通知")