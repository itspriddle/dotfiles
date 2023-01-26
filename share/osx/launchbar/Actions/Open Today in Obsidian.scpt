#!/usr/bin/env osascript

set now to the current date

set now_year to the year of now
set now_month to the month of now as number
set now_day to the day of now as number

if now_month < 10 then
  set now_month to "0" & now_month
end if

if now_day < 10 then
  set now_day to "0" & now_month
end if

set file_path to "700-periodic-notes%2fdaily-notes%2f" & now_year & "-" & now_month & "-" & now_day & ".md"

open location "obsidian://open?vault=notebook&file=" & file_path
