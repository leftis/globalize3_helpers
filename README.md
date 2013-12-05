globalize3_helpers
==================

Form helpers for globalize3.

## Install globalize3_helpers

###Installing gem:

	When using bundler put this in your Gemfile:
   `gem 'globalize3_helpers', :git => 'https://github.com/rui-castro/globalize3_helpers.git'` 

## Using it

### Model:
  Inside your model:

  `accepts_nested_attributes_for :translations`

### View:
  Supports form_for and simple_form
  
  With array of locales:
  (haml syntax)

    - f.globalize_fields_for_locales [ :en, :el ] do |l|
      = l.input :name, input_html: { :class => :span5 }
      = l.input :description, as: :text, input_html: { :class => 'span6 without_radius' }

  With single locale:
  (haml syntax)

    - f.globalize_fields_for_locale :en do |l|
      = l.input :name, input_html: { :class => :span5 }
      = l.input :description, as: :text, input_html: { :class => 'span6 without_radius' }

### Contributing 
  1. Fork the code, add more helpers
  2. Most important contribution would be testing 

### Notice
  I know the current code has a lot of duplication, in the next days i will fix it.

### Copyrights
Copyright (c) 2012 Lefteris Georgatos. See LICENSE.txt for
further details.

