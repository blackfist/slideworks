defmodule Slideworks.LayoutView do
  use Slideworks.Web, :view

  def title do
    "Awesome New Title!"
  end

  def slide_theme(inTheme) do
    if Enum.member?(["black","league","night","simple","solarized","beige","blood","moon","serif","sky","white"], inTheme) do
      "/css/theme/#{inTheme}.css"
    else
      "/css/theme/black.css"
    end
  end
end
