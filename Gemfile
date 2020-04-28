source 'https://rubygems.org'

ruby "2.7.1"
gem 'rails',        '~> 5.1.6'
gem 'rails-i18n'
gem 'bcrypt'
gem 'rounding'
gem 'roo'
gem 'faker'
gem 'bootstrap-sass'
gem 'ransack'
gem 'kaminari'
gem 'hirb'         # 出力結果を表として出力するgem
gem 'hirb-unicode'  # マルチバイト文字の表示を補正するgem
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'better_errors'
gem 'binding_of_caller'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]