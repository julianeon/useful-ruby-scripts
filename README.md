
# Useful Ruby Scripts

This is a partial list of Ruby scripts that demonstrate my use of the language.

I use Ruby for scripting on my laptop. I find it to be very similar to Python, which I also use.

I've tried to give these files self-explanatory names, and they should run, for the most part, without dependencies (exception: httparty).

Released under an MIT license.

## coin_flip_count_streak.rb

This counts how many streaks (example: HHH, TTTTT) occur in a simulation of flipping a coin 1 million times.

## csv_common_addresses.rb

This is an example of CSV parsing, showing how many values are in common (here, addresses) between two CSV files.

## csv_same_column_match_print.rb

This script parses a CSV to find a matching field (addresses).

## file_add_paragraph_tags_to_lines_unless_marked.rb

This script converts plain text to HTML: it adds paragraph tags to a line unless I flagged it to not do that with a special character sequence ("XXX").

## httparty_example.rb

This script makes a GET request to an API endpoint and prints the result. With valid keys, it works.

## loop_15_percent_yearly_increase_100_times.rb

This script shows the result of increaseing a base value 15 percent 100 times (as if a dollar amount was growing 15 percent each year for 100 years).

## loop_odds_65_percent.rb

This script loops through 100 times and counts the value as a 'win' if it exceeds 65 and a 'loss' if less than 65.

## postfix_notation_math.rb

This script does postfile notation math, if you have scbl installed.

## rent_summer.rb

This script sums the amount of values (here, rents) in a file and prints the output.

## sentence_period_newline_adder.rb

This script replaces every line with a period with that line with a period, and a newline added in.

## sleep_random_time.rb

This script sleeps for a random time (pauses for a random amount of time) before printing a sentence and exiting.

## take_file_give_line_numbers.rb

This script takes a file as input and prints it out again to the console with each line prepended with a line number.
