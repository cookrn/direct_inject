DirectInject
============

[![Gem Version](https://badge.fury.io/rb/direct_inject.svg)](http://badge.fury.io/rb/direct_inject)
[![Build Status](https://travis-ci.org/cookrn/direct_inject.svg?branch=master)](https://travis-ci.org/cookrn/direct_inject)
[![Code Climate](https://codeclimate.com/github/cookrn/direct_inject/badges/gpa.svg)](https://codeclimate.com/github/cookrn/direct_inject)
[![Coverage Status](https://img.shields.io/coveralls/cookrn/direct_inject.svg)](https://coveralls.io/r/cookrn/direct_inject)
[![Dependency Status](https://gemnasium.com/cookrn/direct_inject.svg)](https://gemnasium.com/cookrn/direct_inject)


A Sprockets-aware library that helps you inject assets inline into your HTML.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'direct_inject'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install direct_inject

## Usage

### Why?

Recently I was working on a application experimenting with public-key
cryptography in Javascript. I didn't want to manually manage my assets
or hand-roll them into HTML. You might be saying to yourself: "Why in
FSM's name would you be doing crypto in the browser?!" Just know that it
was only an experiment. Anyhow, it would have been great to have a way
to utilize Sprockets for managing all of the assets, but be able to
use them directly inline on the page. Hence, DirectInject was born.

### Usage from Rails

DirectInject detects whether it has been loaded in Rails automagically.
The only requirement is that you're using Rails >= 3.1.

Once you're up and running, you have a few extra helpers in your views
now:

1. `direct_inject_image`: This will find the image in your environment,
    encode it, and place it in your view inline.
2. `direct_inject_javascript`: This will find the script in your environment,
    and place it in your view inline.
3. `direct_inject_stylesheet`: This will find the stylesheet in your environment,
    and place it in your view inline.

### Usage Elsewhere

DirectInject can be used in any Sprockets-enabled application, but it'll
need a bit more help to get setup.

First, let's configure the environment:

```ruby
DirectInject.sprockets_environment = MyApp.assets
```

Next, we're able to render images, javascript, and stylesheets using the
following API:

```ruby
image_tag      = DirectInject.render_image( 'logo.png' )
javascript_tag = DirectInject.render_javascript( 'main' )
stylesheet_tag = DirectInject.render_stylesheet( 'application' )
```

```html
<img src="data:image/png;base64,MUMBOJUMBO">
<script type="text/javascript">/* the codez */</script>
<style type="text/css">/* the stylez */</style>
```

The output is just strings containing HTML that you can use as needed.

### Miscellaneous

DirectInject's API accepts an options hash as the final argument to any
of the functions. This has is converted into HTML attributes for the
resulting markup. For example, to add a CSS class:

```ruby
DirectInject.render_stylesheet \
  'application',
  :class => 'the-fanciest-styles-in-the-world'
```

```html
<style class="the-fanciest-styles-in-the-world">/* styles */</style>
```

Or, for another example, a few data attributes:

```ruby
DirectInject.render_stylesheet \
  'application',
  :data => { 'attr1' => 'val1' , 'attr2' => 'val2' }
```

```html
<style data-attr1="val1" data-attr2="val2">/* styles */</style>
```

DirectInject will automatically add some data attributes to all of the
HTML it outputs:

* `data-direct_inject_source`: the specified asset source
* `data-direct_inject_type`: the asset type that defined the compilation code path for the source

```html
<img data-direct_inject_source="headshot.png" data-direct_inject_type="image">
<script data-direct_inject_source="application" data-direct_inject_type="javascript"></script>
<style data-direct_inject_source="site" data-direct_inject_type="stylesheet"></style>
```

DirectInject supports injecting multiple assets simultaneously.

```ruby
DirectInject.render_javascript \
  'core.js.coffee',
  'utils.js.coffee'
```

```html
<script data-direct_inject_source="core.js.coffee">/* the codez */</script>
<script data-direct_inject_source="utils.js.coffee">/* the codez */</script>
```

## Contributing

1. Fork it ( https://github.com/cookrn/direct_inject/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT. See: [LICENSE](https://github.com/cookrn/direct_inject/blob/master/LICENSE)
