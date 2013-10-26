(* Convert Keynote Presentation to Remark HTML

by Derick Fay
2013-10-26

usage:
Open a Keynote presentation, then run the script.  Remark ( http://gnab.github.io/remark/#1 ) HTML will be copied to the clipboard.

limitations:
- doesn't do anything with images since they are not readable with Applescript
- ignores transitions
- returns master slides as metadata but does nothing with them - this could be altered to select a class based on corresponding css
*)

tell application "Keynote 5.3" (* Change to "Keynote" if you haven't installed Oct 2013 version of iWork *)
	set buildByBullet to true (* uses the trick described here https://github.com/gnab/remark/issues/46 to simulate a build-in by bullet point *)
	set lfs to "

"
	set mdResult to ""
	set x to 0
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

set mdResult to "<!DOCTYPE html>
<html>
  <head>
    <title>" & theShowTitle & "</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <style type='text/css'>
      /* Slideshow styles */
    </style>
  </head>
  <body>
    <textarea id='source'>
" & mdResult & "</textarea>
    <script src='http://gnab.github.io/remark/downloads/remark-0.5.9.min.js' type='text/javascript'>
    </script>
    <script type='text/javascript'>
      var slideshow = remark.create();
    </script>
  </body>
</html>"

set the clipboard to mdResult