
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Andreas Kriegler"
#let locale-catalog-page-numbering-style = context { "Andreas Kriegler - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Oct 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "New Computer Modern"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "New Computer Modern"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "New Computer Modern"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "New Computer Modern"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Andreas Kriegler

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Vienna, Austria],
  [#box(original-link("mailto:krieglerandreas@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)krieglerandreas\@gmail.com])],
  [#box(original-link("tel:+43-670-5563965")[#fa-icon("phone", size: 0.9em) #h(0.05cm)+43 670 5563965])],
  [#box(original-link("https://andreaskriegler.eu/")[#fa-icon("link", size: 0.9em) #h(0.05cm)andreaskriegler.eu])],
  [#box(original-link("https://scholar.google.com/citations?user=xzhMsboAAAAJ")[#fa-icon("graduation-cap", size: 0.9em) #h(0.05cm)Google Scholar])],
  [#box(original-link("https://orcid.org/0000-0002-5653-5181")[#fa-icon("orcid", size: 0.9em) #h(0.05cm)0000-0002-5653-5181])],
  [#box(original-link("https://github.com/akriegler")[#fa-icon("github", size: 0.9em) #h(0.05cm)akriegler])],
  [#box(original-link("https://researchgate.net/profile/Andreas-Kriegler")[#fa-icon("researchgate", size: 0.9em) #h(0.05cm)Andreas-Kriegler])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [PhD student in Computer Vision at TU Wien, set to finish in late 2026.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [I am a PhD student in Computer Vision at the #link("https://cvl.tuwien.ac.at/")[CVL] at TU Wien. My supervisor is #link("https://informatics.tuwien.ac.at/people/margrit-gelautz")[Prof. Margrit Gelautz]. My research is funded by the #link("https://www.ait.ac.at/")[AIT Austrian Institute of Technology] where I am further advised by #link("https://publications.ait.ac.at/en/persons/csaba.beleznai")[Csaba Beleznai].]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [My research lies in the intersection of classical Computer Vision, Deep Learning and Computer Graphics. The goal is to develop novel methods for highly generic object pose estimation. We are specifically interested in the geometry of objects and exploit rendering engines to generate synthetic data.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Before joining the PhD program, I received my M.Sc. and B.Sc. degrees in Mechatronics\/Robotics from the UAS Technikum Wien, both with distinction.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[TU Wien]

#emph[Dr. techn. \(PhD\) in Computer Science]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Mar 2021 – present]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[University of Applied Sciences Technikum Wien]

#emph[M.Sc. \(with distinction\) in Mechatronics\/Robotics]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Sept 2018 – Oct 2020]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[University of Applied Sciences Technikum Wien]

#emph[B.Sc. \(with distinction\) in Mechatronics\/Robotics]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Sept 2015 – June 2018]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[PhD Student]

#emph[AIT Austrian Institute of Technology]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Mar 2021 – present]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Univ. Research Assistant \(external\)]

#emph[TU WIEN]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Mar 2021 – present]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Computer Vision Engineer]

#emph[AIT Austrian Institute of Technology]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Nov 2020 – Mar 2021]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Diploma Student]

#emph[AIT Austrian Institute of Technology]
  ],
  right-content: [
    #emph[Vienna, Austria]

#emph[Sept 2018 – Oct 2020]
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Application and Control Engineering Intern]

#emph[SMS Group]
  ],
  right-content: [
    #emph[Düsseldorf, Germany]

#emph[Aug 2017 – Jan 2018]
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Academic Work


#two-col-entry(
  left-content: [
    #strong[I Can't Believe It's Not Better Initiative]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [I joined the ICBINB initiative after the NeurIPS 2022 workshop. Our aim is to foster a community beyond benchmark climbing, specifically to provide a venue for negative results as well as introspective works. I helped organize the #link("https://sites.google.com/view/icbinb-2023")[2023 NeurIPS] and #link("https://sites.google.com/view/icbinb-2025")[2025 ICLR] workshops with them. Together with Prof. Neil Lawrence we publish outstanding works in the #link("Proceedings of Machine Learning Research")[Proceedings of Machine Learning Research series].])], column-gutter: 0cm)
  ],
  right-content: [
    #emph[Worldwide]

#emph[2022 – present]
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Teaching \(TU Wien, guest lectures\)]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Stereo Vision \(188.513\): 2021S, 2024S],[Video Analysis \(188.329\): 2021W, 2022W, 2023W],[Visual Analysis of Human Motion \(188.468\): 2022S, 2023S, 2025S],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Reviewing]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Journals: #link("https://link.springer.com/journal/11263")[IJCV], #link("https://link.springer.com/journal/12369")[IJSR], #link("https://sciendo.com/journal/IJCSS")[IJCSS]],[Conferences: #link("https://icml.cc/")[ICML], #link("https://www.siggraph.org/")[SIGGRAPH], #link("https://www.dagm-gcpr.de/year/2023")[DAGM], #link("https://www.tugraz.at/events/cvww2025/home")[CVWW], #link("https://www.isispa.org/home")[ISPA], #link("https://workshops.aapr.at/")[ÖAGM]],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Editor]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([NeurIPS\/ICLR ICBINB workshop proceedings: #link("https://proceedings.mlr.press/")[PMLR]],)
  ],
)



== Summer Schools


#two-col-entry(
  left-content: [
    #strong[International Computer Vision Summer School \(ICVSS\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Attended the summer school and passed the examination session \(1h\)])], column-gutter: 0cm)
  ],
  right-content: [
    #emph[Sicily, Italy]

#emph[July 2024]
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[British Machine Vision Association Computer Vision Summer School]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Participated in 32 contact hours with exercises at the University of Lincoln])], column-gutter: 0cm)
  ],
  right-content: [
    #emph[Lincoln, United Kingdom]

#emph[July 2019]
  ],
)



== Awards


#one-col-entry(
  content: [- Graduated with distinction from the Master's degree \(2020\) at UAS Technikum Wien],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Graduated with distinction from the Bachelor's degree \(2018\) at UAS Technikum Wien],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- My 2nd Bachelor thesis was nominated as the \"Best Bachelor Thesis in Mechatronics in Austria \(2018\)\"],
)


== Scholarships


#one-col-entry(
  content: [- Received two scholarships from the UAS Technikum Wien for exceptional academic success \(17\/18, 19\/20\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Received a scholarship from the Karl-Seitz-Stiftung, reserved for students with exceptional academic success and difficult family background \(2017\)],
)


== Selected Publications


#two-col-entry(
  left-content: [
    #strong[Review Paper: Body Movement Mirroring and Synchrony in Human-Robot Interaction]

  ],
  right-content: [
    Oct 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);D. Stoeva, #strong[#emph[A. Kriegler]], M. Gelautz

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1145/3682074")[10.1145/3682074] (ACM Transactions on Human-Robot Interaction \(THRI\))])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PrimitivePose: Generic Model and Representation for 3D Bounding Box Prediction of Unseen Objects]

  ],
  right-content: [
    Aug 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[A. Kriegler]], C. Beleznai, M. Gelautz, M. Murschitz, K. Göbel

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1142/S1793351X23620027")[10.1142/S1793351X23620027] (International Journal of Semantic Computing \(IJSC\))])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Paradigmatic Revolutions in Computer Vision]

  ],
  right-content: [
    Dec 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[A. Kriegler]]

#v(design-highlights-top-margin - design-text-leading)#link("https://drive.google.com/file/d/1ItDGcljAQOYo-HKHJLcC4gAgapCIQPns/view")[drive.google.com/file/d/1ItDGcljAQOYo-HKHJLcC4gAgapCIQPns/view] (Advances in Neural Information Processing Systems 35 \(NeurIPS 2022\) - I Can't Believe It's Not Better \(ICBINB\) Workshop)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[The Aircraft Context Dataset: Understanding and Optimizing Data Variability in Aerial Domains]

  ],
  right-content: [
    Nov 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);D. Steininger, V. Widhalm, J. Simon, #strong[#emph[A. Kiegler]], C. Sulzbacher

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/ICCVW54120.2021.00426")[10.1109/ICCVW54120.2021.00426] (2021 IEEE\/CVF International Conference on Computer Vision Workshops \(ICCVW\))])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vision-based Docking of a Mobile Robot]

  ],
  right-content: [
    Aug 2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[A. Kriegler]], W. Wöber

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3217/978-3-85125-752-6-03")[10.3217/978-3-85125-752-6-03] (Joint Austrian Computer Vision and Robotics Workshop \(ACVRW\))])



