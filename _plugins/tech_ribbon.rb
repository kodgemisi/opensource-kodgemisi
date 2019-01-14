class TechRibbonTag < Liquid::Tag

  @@ribbonClass = {
    'java' => 'ribbon-success',
    'spring' => 'ribbon-success',
    'python' => 'ribbon-info',
    'javascript' => 'ribbon-warning'
  }

  @@iconClass = {
    'java' => 'mdi-coffee-outline',
    'spring' => 'mdi-leaf',
    'python' => 'mdi-language-python',
    'javascript' => 'mdi-language-javascript'
  }

  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    lang = context[@input.strip]
    clazz = @@ribbonClass[lang] || 'ribbon-default'
    iconClass = @@iconClass[lang] || 'mdi-code-tags'

    return "<div class=\"ribbon ribbon-corner #{clazz} ribbon-right ribbon-bottom\"><i class=\"mdi #{iconClass} \"></i></div>"
  end

end
Liquid::Template.register_tag('tech_ribbon', TechRibbonTag)