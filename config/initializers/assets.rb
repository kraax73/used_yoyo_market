# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )




#Railsの場合、JavaScriptはプリコンパイルされている必要がある。
#自動読み込みを無効にしている場合は手動でプリコンパイル対象にJavaScriptファイルを指定する必要がある。
#下のコードで階層のJavaScriptファイルをプリコンパイル対象に指定する。
Rails.application.config.assets.precompile += %w( *.js )