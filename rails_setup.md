## Ruby on Rails



#### Side notes

  * scafolding

  * action mailer





#### Initial Rails App Setup

  1. gem install rails

    * install globally only once or upgrade

  2. rbenv rehash

  3. brew update

  4. brew upgrade

  =========================

  5. rails new tunr_app -d postgresql

    * setup up new rails app name tunr_app with postgresql

  6. rails s

    * start rail server

  7. pgstart == > open new tab ==> rake db:create

  8. router setup

    * config -> routes.rb

  9. controller setup

    * touch inside app/controllers/ welcome_controller.rb

  10. change gemfile line 37 from gem 'bye-bug' to gem 'pry-rails'

  11. bundle install

    * same as npm install

  12. rails c

    * pry console environment

  13. WelcomeController setup

    ```ruby

    class WelcomeController < ApplicationController

      def index

        @greeting = "hellooo"

      end

    end



```

 14. create welcome folder inside app/views

 15. create index.html.erb



```

html

    <%= @greeting %>



```

 16. rails g migration CreateUsers

   * create SQL database Users



```

ruby

  class CreateUsers < ActiveRecord::Migration

    def change

      create_table :users do |t|

        t.string :username # add in actual tables

        t.string :password_digest # add in actual tables

      end

    end

  end



  class CreateSongs < ActiveRecord::Migration

    def change

      create_table :songs do |t|

        t.string :title

        t.text :alum

        t.string :preview_url

        t.string :artwork

        t.integer :price

        t.references :artist

        t.timestamps

      end

    end

  end



```

 17. rake db:migrate

   * command to migrate the actual database

 18. touch app/models/user.rb



```

ruby

    class User < ActiveRecord::Base



    end



```

 19. User.create(username: "Jimmy", password_digest: "password")

   * command to create new user

 20. rake db:rollback

   * undo previous migration

 21. rake db:drop

   * drop all tables

 22. rake db:create

   * re-create migrations

 23. new_user = User.new

   * create a template of new user

 24. Create routes



```

ruby

  root 'users#new'

  resources :users, only: [:new, :create, :show, :destroy]

  resources :songs

  resources :artists

  resources :playlist do

    member do

      put 'add_song'

      put 'remove_song'

    end

  end

  get 'sessions/new' => 'sessions#new'

  post 'sessions/new' => 'sessions#create'

  delete 'sessions/new' => 'sessions#delete'



```

 25. rake routes

   * see the list of routes

 26. rake routes | grep users

   * limit to just the user routes

```
