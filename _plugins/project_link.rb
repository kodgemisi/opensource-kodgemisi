class ProjectLinkTag < Liquid::Tag

  @@linkClass = {
    'github' => 'mdi-github-circle',
    'demo' => 'mdi-presentation-play',
    'bitbucket' => 'mdi-bitbucket'

  }

  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    url = context[@input.strip]
    clazz = @@linkClass[url['type']] || 'mdi-link-variant'

    return "<i class=\"mdi #{clazz}\"></i>" +
           "<a class=\"project-link\" href=\"#{url['link']}\" target=\"_blank\"> #{url['type'].capitalize()}</a>"
  end

end
Liquid::Template.register_tag('project_link', ProjectLinkTag)