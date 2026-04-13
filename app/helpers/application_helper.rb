module ApplicationHelper
  # SEO Helpers
  def seo_title(page_title = nil)
    base_title = 'Receitas de Família'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      "#{base_title} | Comida Caseira Tradicional"
    end
  end

  def seo_description(description = nil)
    default = 'Descubra receitas tradicionais de família. Comida caseira da vovó com amor e tradição.'
    description || default
  end

  # Formatação de textos
  def format_ingredients(text)
    return [] if text.blank?
    text.split(/\r?\n/).map(&:strip).reject(&:blank?)
  end

  def format_instructions(text)
    return [] if text.blank?
    text.split(/\r?\n/).map(&:strip).reject(&:blank?)
  end

  # Nomes amigáveis para enums
  def region_name(region)
    {
      'norte' => 'Norte',
      'nordeste' => 'Nordeste',
      'centro_oeste' => 'Centro-Oeste',
      'sudeste' => 'Sudeste',
      'sul' => 'Sul',
      'geral' => 'Geral'
    }[region.to_s] || region.to_s.humanize
  end

  def occasion_name(occasion)
    {
      'natal' => 'Natal',
      'pascoa' => 'Páscoa',
      'festa_junina' => 'Festa Junina',
      'dia_dos_pais' => 'Dia dos Pais',
      'dia_das_maes' => 'Dia das Mães',
      'aniversario' => 'Aniversário',
      'dia_a_dia' => 'Dia a Dia'
    }[occasion.to_s] || occasion.to_s.humanize
  end

  def category_name(category)
    {
      'entrada' => 'Entrada',
      'prato_principal' => 'Prato Principal',
      'sobremesa' => 'Sobremesa',
      'bebida' => 'Bebida',
      'acompanhamento' => 'Acompanhamento'
    }[category.to_s] || category.to_s.humanize
  end

  # Schema.org JSON-LD para receitas
  def recipe_schema_json(recipe)
    return nil unless recipe

    {
      '@context': 'https://schema.org',
      '@type': 'Recipe',
      name: recipe.title,
      description: recipe.description,
      image: recipe.image_url,
      prepTime: recipe.prep_time ? "PT#{recipe.prep_time}M" : nil,
      recipeYield: recipe.servings ? "#{recipe.servings} porções" : nil,
      recipeIngredient: format_ingredients(recipe.ingredients),
      recipeInstructions: format_instructions(recipe.instructions).map { |step|
        { '@type': 'HowToStep', text: step }
      },
      author: {
        '@type': 'Organization',
        name: 'Receitas de Família'
      }
    }.compact.to_json
  end
end
