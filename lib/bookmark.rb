# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(title:, url:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}, #{url}')")
  end
end
