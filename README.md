# ComfyFaq
ComfyFaq is an simple faq management engine for [ComfortableMexicanSofa](https://github.com/comfy/comfortable-mexican-sofa) (for version >= 1.8).

## Features

* Ability to set up multiple faq per site

## Installation

Add gem definition to your Gemfile:

```ruby
gem 'comfy_faq'
```

Then from the Rails project's root run:

    bundle install
    rails generate comfy:faq
    rake db:migrate

Take a look inside your `config/routes.rb` file and you should see following lines there:

```ruby
comfy_route :faq_admin, path: 'admin'
comfy_route :faq, path: 'faq'
```

You should also find view templates in `/app/views/cms/faq` folder. Feel free to adjust them as you see fit.

---

Copyright 2014 Tomasz Pajor, [Montrose Software LLC](http://www.montrosesoftware.com)
