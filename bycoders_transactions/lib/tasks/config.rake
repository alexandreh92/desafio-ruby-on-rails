namespace :config do
  task :database do
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    `rake db:seed`
  end
end

task dev: 'config:database'
