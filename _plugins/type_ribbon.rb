class TypeRibbonTag < Liquid::Tag

  @@ribbonClass = {
    'java' => 'ribbon-success',
    'spring-plugin' => 'ribbon-success',
    'library' => 'ribbon-info',
    'python' => 'ribbon-info',
    'javascript' => 'ribbon-warning'
  }

  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    lang = context[@input.strip]
    clazz = @@ribbonClass[lang] || 'ribbon-default'

    return "<div class=\"ribbon #{clazz}\">#{lang}</div>"
  end

end
Liquid::Template.register_tag('type_ribbon', TypeRibbonTag)