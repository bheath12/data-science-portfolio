library(gt)
library(dplyr)

nba_data <- read_csv("nba_standings_project.csv")

nba_data%>%
  
  gt()%>%
  
  #Title and subtitle for table
  tab_header(
    title = md("2024 NBA Team Review Post All-Star Break"),
    subtitle = md("Change in Win Percentage from Last Season<br>Data through Feb 22, 2024")
  )%>%
  
  # hides unnecessary columns
  cols_hide(columns = c(`2023 W`, `2023 L`, `2024 W`, `2024 L`))%>%
  
  opt_align_table_header(align = "left")%>%
  
  # Column header names
  cols_label(
    `Team` = md("**TEAM**"),
    `2024 Win` = md("***2024 Win %***"),
    `2023 Win` = md("***2023 Win %***"),
    `Win Diff` = md("***Difference***")
  )%>%
  
  # Aligns title and subtitle to the left, column formatting
  opt_align_table_header(align = "left")%>%
  fmt_number(columns = everything())%>%
  cols_width(
    `2024 Win` ~ px(50),
    `2023 Win` ~ px(50),
    `Win Diff` ~ px(70)
  )%>%
  
  # Footnote
  tab_source_note(
    source_note = md("SOURCE: BASKETBALL-REFERENCE.COM<br>Visual & Analysis by Bronson Heath")
  )%>%

  # Color conditioning
  data_color(
    columns = c(`Win Diff`),
    colors = scales::col_numeric(
      palette = c(
        "red1", "yellow", "green3"),
      domain = NULL
    )
  )%>%
  
  # Font change and table formatting
  opt_table_font(font = google_font("Helvetica"), weight = 200)%>%
  tab_options(table.font.size = 5, data_row.padding = px(1.5), heading.padding = px(2))


