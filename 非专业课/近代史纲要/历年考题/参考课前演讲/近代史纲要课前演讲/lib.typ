// Stargazer theme - adapted for BUAA
#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#let buaa-theme(
  aspect-ratio: "16-9",
  lang: "en",
  font: ("Linux Libertine",),
  ..args,
  body,
) = {

  set text(lang: lang, font: font)
  show: if lang == "zh" {
    import "@preview/cuti:0.3.0": show-cn-fakebold
    show-cn-fakebold
  } else {
    it => it
  }

  show: stargazer-theme.with(
    aspect-ratio: aspect-ratio,
    config-info(
      // logo: image("assets/vi/buaa-logo.svg"),
    ),
    ..args,
  )

  body
}
