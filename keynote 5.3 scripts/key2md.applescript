(* Convert Keynote Presentation to Markdown without metadata or presenter notes

by Derick Fay
2013-09-20

usage:
Open a Keynote presentation, then run the script.  Markdown will be copied to the clipboard.

This is a stripped-down version of 'Convert Keynote Presentation to Remark Markdown' designed to produce a Markdown representation of the presentation contents as displayed (i.e. no presenter notes or metadata)

limitations:
- doesn't do anything with images since they are not readable with Applescript
*)

tell application "Keynote"
	set mdResult to ""
	set lfs to "

"
	set x to 0
	set theShow to slides of slideshow 1
	repeat with mySlide in theShow
		-- ignore skipped slides
		if skipped of mySlide is false then
			-- collect the contents of the slides
			set theTitle to title of mySlide
			set theBody to body of mySlide
			set eachBullet to paragraphs of theBody
			
			--create the markdown
			-- ignore blank text fields
			if theTitle is not "Double-click to edit" then
				set mdResult to mdResult & "# " & theTitle & lfs
			end if
			
			repeat with i in eachBullet
				if i as string is not "Double-click to edit" then
					set mdResult to mdResult & "- " & i & lfs
				end if
			end repeat
			
			-- add a new slide unless this is the last slide - i.e. avoid having a blank slide at the end
			set x to x + 1
			if x < (count of theShow) then
				set mdResult to mdResult & "---" & lfs
			end if
		end if
	end repeat
end tell

set the clipboard to mdResult