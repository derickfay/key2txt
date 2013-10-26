(* Convert Keynote Presentation to Remark Markdown

by Derick Fay
2013-09-20

usage:
Open a Keynote presentation, then run the script.  Markdown will be copied to the clipboard.  Designed to produce Markdown for use with Remark ( http://gnab.github.io/remark/#1 )

limitations:
- doesn't do anything with images since they are not readable with Applescript
- ignores transitions
- returns master slides as metadata but does nothing with them - this could be altered to select a class based on corresponding css
*)

tell application "Keynote 5.3" (* Change to "Keynote" if you haven't installed Oct 2013 version of iWork *)
	set buildByBullet to true (* uses the trick described here https://github.com/gnab/remark/issues/46 to simulate a build-in by bullet point *)
	set mdResult to "<!DOCTYPE html>
<html>
  <head>
    <title>Title</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <style type='text/css'>
      /* Slideshow styles */
    </style>
  </head>
  <body>
    <textarea id='source'>
"
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
			set theNotes to notes of mySlide
			set eachNote to paragraphs of theNotes
			set theMaster to master of mySlide
			
			--create the markdown
			set mdResult to mdResult & "master: " & name of theMaster & lfs
			
			-- ignore blank text fields
			if theTitle is not "Double-click to edit" then
				set mdResult to mdResult & "# " & theTitle & lfs
			end if
			
			set y to 0
			repeat with i in eachBullet
				if i as string is not "Double-click to edit" then
					set mdResult to mdResult & "- " & i & lfs
					set y to y + 1
					if y < (count of eachBullet) then
						if buildByBullet then
							set mdResult to mdResult & "--" & lfs
						end if
					end if
				end if
			end repeat
			
			-- comment out the following ifÉend if to exclude presenter notes 
			if eachNote is not {} then
				set mdResult to mdResult & "???" & lfs --use Remark Markdown format for presenter notes
				repeat with i in eachNote
					if i is not "" then
						set mdResult to mdResult & i & lfs
					end if
				end repeat
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