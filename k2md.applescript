(* Convert Keynote Presentation to Markdown without metadata or presenter notes

by Derick Fay

2014-04-02: updated for Keynote 6
2013-09-20: Keynote '09 version

usage:
Open a Keynote presentation, then run the script.  Markdown will be written to a file with the same name as the original, in a user-selected directory.

This is a stripped-down version of 'Convert Keynote Presentation to Remark Markdown' designed to produce a Markdown representation of the presentation contents as displayed (i.e. no presenter notes or metadata)

limitations:
- doesn't do anything with images since they are not readable with Applescript
*)

set theFolder to choose folder with prompt "Select output location"

tell application "Keynote"
	set theFileName to name of document 1
	set mdResult to ""
	set lfs to "

"
	set x to 0
	set theShow to slides of document 1
	repeat with mySlide in theShow
		-- ignore skipped slides
		if skipped of mySlide is false then
			-- collect the contents of the slides
			set theTitle to the object text of the default title item of mySlide
			set theBody to the object text of the default body item of mySlide
			set eachBullet to paragraphs of theBody
			--create the markdown
			-- ignore blank text fields
			if theTitle is not "Double-click to edit" then
				set mdResult to mdResult & "# " & theTitle & lfs
			end if
			
			repeat with i in eachBullet
				if i as string is not "Double-click to edit" and (length of i as string > 0) then
					set mdResult to mdResult & "* " & i & "
"
				end if
			end repeat
			
			if (length of eachBullet > 0) then
				set mdResult to mdResult & "
"
			end if
			
			set allNotes to ""
			set eachNote to the paragraphs of the presenter notes of mySlide
			
			repeat with i in eachNote
				if (length of i as string > 0) then
					set allNotes to allNotes & i & " "
				end if
			end repeat
			
			if ((length of allNotes as string) > 0) then
				set mdResult to mdResult & "^" & allNotes & lfs
			end if
			
			-- add a new slide unless this is the last slide - i.e. avoid having a blank slide at the end
			set x to x + 1
			if x < (count of theShow) then
				set mdResult to mdResult & "---" & lfs
			end if
		end if
	end repeat
end tell

set theFile to ((POSIX path of theFolder) as string) & theFileName & ".md"

do shell script "echo " & quoted form of mdResult & " > " & quoted form of theFile