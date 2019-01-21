class TypeRibbonTag < Liquid::Tag

  @@ribbonClass = {

  }

  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    lang = context[@input.strip]
    clazz = @@ribbonClass[lang] || 'ribbon-info'

    return "<div class=\"ribbon #{clazz}\">#{lang}</div>"
  end

end
Liquid::Template.register_tag('type_ribbon', TypeRibbonTag)