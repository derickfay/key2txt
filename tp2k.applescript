-- by Derick Fay
-- 2014-04-02: updated for Keynote 6

tell application "TaskPaper"
	set theProjects to projects of document 1
	
	repeat with theProject in theProjects
		set theProjectName to name of theProject
		
		set theTasks to tasks of theProject
		set theBodyText to ""
		set n to 0
		repeat with theTask in theTasks
			set n to n + 1
			set theTaskText to (name of theTask as rich text)
			set theBodyText to theBodyText & theTaskText
			if n is not (count of theTasks) then
				set theBodyText to theBodyText & return
			end if
			
		end repeat
		
		set theNotes to notes of theProject
		set theNotesText to ""
		repeat with theNote in theNotes
			set theNoteText to name of theNote
			set theNotesText to theNotesText & return & theNoteText
		end repeat
		
		
		tell application "Keynote"
			activate
			tell document 1
				if (text 1 through 2) of theProjectName = "![" then
					set theFileName to item 2 of my explode(theProjectName, {"(", ")"})
					make image slides paths(theFileName)
					set theProjectName to ""
					-- above line works in stand-alone script but not here
				else
					set newSlide to make new slide
					if theProjectName is "" then
						set the base slide of current slide to master slide "Bullets"
					end if
				end if
				tell newSlide
					set object text of default title item to theProjectName
					set object text of default body item to theBodyText
					set presenter notes to theNotesText
				end tell
			end tell
		end tell
		
	end repeat
	
end tell

on explode(the_string, separators)
	set old_delims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to separators
	set r to every text item of the_string
	set AppleScript's text item delimiters to old_delims
	return r
end explode