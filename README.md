Sample Sinatra application demonstrating HTTP caching headers referenced by the Heroku Dev Center article, "[Mobile Device Network Caching in iOS](https://devcenter.heroku.com/articles/ios-network-caching)".

### Deploy to Heroku

To deploy this application to your own Heroku account, perform the following.

Ensure you have installed the [Heroku Toolbelt](https://toolbelt.heroku.com) or all prerequisites included. Then:

```term
$ git clone https://github.com/heroku/devcenter-client-caching-sinatra-example.
Cloning into devcenter-client-caching-sinatra-example...
remote: Counting objects: 7, done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 7 (delta 0), reused 7 (delta 0)
Unpacking objects: 100% (7/7), done.

$ cd devcenter-client-caching-sinatra-example.git

$ heroku create -s cedar
Creating floating-wind-3377... done, stack is cedar
http://floating-wind-3377.herokuapp.com/ | git@heroku.com:floating-wind-3377.git
Git remote heroku added

$ git push heroku master
Counting objects: 7, done.
Delta compression using up to 4 threads.
...

-----> Heroku receiving push
-----> Ruby/Rack app detected
-----> Installing dependencies using Bundler version 1.2.0.pre
       Running: bundle install --without development:test --path vendor/bundle --binstubs bin/ --deployment
       Fetching gem metadata from http://rubygems.org/.....
       Installing daemons (1.1.8)
       Installing eventmachine (0.12.10) with native extensions
       Installing json (1.7.3) with native extensions
       Installing rack (1.4.1)
       Installing rack-protection (1.2.0)
       Installing tilt (1.3.3)
       Installing sinatra (1.3.2)
       Installing thin (1.3.1) with native extensions
       Using bundler (1.2.0.pre)
       Your bundle is complete! It was installed into ./vendor/bundle
       Cleaning up the bundler cache.
-----> Discovering process types
       Procfile declares types     -> web
       Default types for Ruby/Rack -> console, rake
-----> Compiled slug size is 3.5MB
-----> Launching... done, v3
       http://floating-wind-3377.herokuapp.com deployed to Heroku
```

Then open `http://floating-wind-3377.herokuapp.com/founders` using your Heroku app-name.