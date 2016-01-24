DataMapper.setup(:default, {
  adapter: 'sqlite3',
  database: "#{Dir.pwd}/db/development.db"
})