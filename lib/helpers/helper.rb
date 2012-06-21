module ActionView
  module Helpers
    class FormBuilder

      def globalize_fields_for_locales(locales = [], *args, &proc)
        raise ArgumentError, "Missing block" unless block_given?
        globalize_fields_for(locales.first.to_s, *args, &proc) if locales.count <= 1
        translations_fields = []

        locales.each do |locale|
          @index = @index ? @index + 1 : 1
          object_name = "#{@object_name}[translations_attributes][#{@index}]"
          object = @object.translations.find_by_locale locale.to_s
          @template.concat @template.hidden_field_tag("#{object_name}[id]", object ? object.id : "")
          @template.concat @template.hidden_field_tag("#{object_name}[locale]", locale)
          if @template.respond_to? :simple_fields_for
            @template.concat @template.simple_fields_for(object_name, object, *args, &proc)
          else
            @template.concat @template.fields_for(object_name, object, *args, &proc)
          end
        end
      end

      def globalize_fields_for_locale(locale, *args, &proc)
        raise ArgumentError, "Missing block" unless block_given?
        @index = @index ? @index + 1 : 1
        object_name = "#{@object_name}[translations_attributes][#{@index}]"
        object = @object.translations.find_by_locale locale.to_s
        @template.concat @template.hidden_field_tag("#{object_name}[id]", object ? object.id : "")
        @template.concat @template.hidden_field_tag("#{object_name}[locale]", locale)
        if @template.respond_to? :simple_fields_for
          @template.simple_fields_for(object_name, object, *args, &proc)
        else
          @template.fields_for(object_name, object, *args, &proc)
        end
      end

    end
  end
end
