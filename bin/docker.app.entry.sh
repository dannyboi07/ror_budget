#!/bin/bash

rails db:create
rails db:migrate

bundle exec puma -C config/puma.rb