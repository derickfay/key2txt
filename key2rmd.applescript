(* Convert Keynote Presentation to Remark Markdown

by Derick Fay
2013-10-27

usage:
Open a Keynote presentation, then run the script.  Markdown will be copied to the clipboard.  Designed to produce Markdown for use with Remark ( http://gnab.github.io/remark/#1 )
an alert will display if the presentation has any potentially missing images based on master slides used

Keynote master slides supported with automatic styling:
Title & Subtitle
Title - Center
Title & Bullets
Bullets
Blank
Photo - Horizontal
Title - Top
Title, Bullets & Photo
Title & Bullets - 2 Column - TODO
Photo - Vertical - TODO

limitations:
- doesn't do anything with images since they are not readable with Applescript
- ignores transitions
- "Title & Bullets - 2 Column" and "Title, Bullets and Photo" Keynote themes don't style properly
- styles are currently embedded in script and should be moved to external file eventually
- doesn't detect nested lists
- treats every paragraph as a bullet whether it's a bullet in Keynote or not
*)

tell application "Keynote 5.3" (* Change to "Keynote" if you haven't installed Oct 2013 version of iWork *)
	set buildByBullet to true (* uses the trick described here https://github.com/gnab/remark/issues/46 to simulate a build-in by bullet point *)
	set lfs to "

"
	set mdResult to ""
	set x to 0
	set missingImages to 0 -- we will count potentially missing images based on the names of master slides
	set theShow to slides of slideshow 1
	set theShowTitle to title of slide 1 of slideshow 1
	repeat with mySlide in theShow
		-- ignore skipped slides
		if skipped of mySlide is false then
			-- collect the contents of the slides
			set theTitle to title of mySlide
			set theBody to body of mySlide
			set eachBullet to paragraphs of theBody
			set theNotes to notes of mySlide
			set eachNote to paragraphs of theNotes
			set theMaster to master of mySlide
			
			--create the markdown
			--set mdResult to mdResult & "master: " & name of theMaster & lfs
			
			--add classes for Titles corresponding to Keynote themes
			set c to ""
			set n to name of theMaster
			if (n = "Title & Subtitle") or (n = "Title - Center") then
				set c to "class: middle, center" -- based on https://github.com/gnab/remark/wiki/Text-Alignment
			else if (n = "Title & Bullets") or (n = "Title - Top") or (n = "Title & Bullets - 2 Column") then
				set c to "class: center"
			else if n = "Photo - Horizontal" then
				set missingImages to missingImages + 1
				set c to "class: bottom, center"
			else if n = "Title, Bullets & Photo" then
				set missingImages to missingImages + 1
				set c to "class: center"
			else if n = "Photo - Vertical" then
				set missingImages to missingImages + 1
				set c to "class: center, middle"
			end if
			
			if c is not "" then
				set mdResult to mdResult & c & lfs
			end if
			
			-- Photo - Horizontal puts the photo above the Title
			if (n = "Photo - Horizontal") then
				set mdResult to mdResult & "![Missing image](image.jpg)" & lfs
			end if
			
			-- Photo - Vertical puts title & subtitle in the left column
			if (n = "Photo - Vertical") then
				set mdResult to mdResult & ".left-column[" & lfs
			end if
			
			-- ignore blank text fields & insert the Title
			if theTitle is not "Double-click to edit" then
				set mdResult to mdResult & "# " & theTitle & lfs
			end if
			
			if (n = "Title, Bullets & Photo") then
				set mdResult to mdResult & ".left-column[" & lfs
			end if
			
			-- add classes for slide bodies corresponding to Keynote themes
			set closeSlide to false
			if (n = "Title & Bullets - 2 Column") then
				set c to ".two-column["
				set mdResult to mdResult & c & lfs
				set closeSlide to true
			end if
			
			-- process the body of the slide
			set y to 0
			set closeIt to false
			repeat with i in eachBullet
				if i as string is not "Double-click to edit" then
					if (n = "Title & Subtitle") or (n = "Photo - Vertical") then
						set mdResult to mdResult & "## " & i & lfs
					else
						-- add classes for bullets corresponding to Keynote themes
						set c to ""
						set closeIt to false
						if (n = "Title & Bullets") or (n = "Title, Bullets & Photo") or (n = "Title & Bullets - 2 Column") then
							set c to ".left["
							set closeIt to true
						end if
						
						if c is not "" then
							set mdResult to mdResult & c & lfs
						end if
						
						-- add the bullet itself
						set mdResult to mdResult & "- " & i & lfs
						set y to y + 1
						if y < (count of eachBullet) then
							if buildByBullet then
								if closeIt then
									set mdResult to mdResult & "]" & lfs
								end if
								set closeIt to false
								-- include presenter notes on the first slide of a multi-bullet slide so they are there for the full (virtual) slide
								if y = 1 then
									if eachNote is not {} then
										set mdResult to mdResult & "???" & lfs --use Remark Markdown format for presenter notes
										repeat with i in eachNote
											if i is not "" then
												set mdResult to mdResult & i & lfs
											end if
										end repeat
									end if
								end if
								set mdResult to mdResult & "--" & lfs
							end if
						end if
						
						
					end if
				end if
			end repeat
			
			if closeIt then
				set mdResult to mdResult & "]" & lfs
			end if
			if closeSlide then
				set mdResult to mdResult & "]" & lfs
			end if
			if (n = "Photo - Vertical") or (n = "Title, Bullets & Photo") then
				set mdResult to mdResult & "]" & lfs & ".right[![Missing image](image.jpg)]" & lfs
			end if
			
			-- include presenter notes if they aren't there already - if no bullets were added, then they weren't added
			if y = 0 then
				if eachNote is not {} then
					set mdResult to mdResult & "???" & lfs --use Remark Markdown format for presenter notes
					repeat with i in eachNote
						if i is not "" then
							set mdResult to mdResult & i & lfs
						end if
					end repeat
				end if
			end if
			
			-- add a new slide unless this is the last slide - i.e. avoid having a blank slide at the end
			set x to x + 1
			if x < (count of theShow) then
				set mdResult to mdResult & "---" & lfs
			end if
		end if
	end repeat
end tell

set the clipboard to mdResult

display alert ((missingImages as string) & " image(s) may be missing")