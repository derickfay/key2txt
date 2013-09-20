tell application "TaskPaper"
	set theDoc to make new document
	set text contents of theDoc to ""
end tell

tell application "Keynote"
	set theShow to slides of slideshow 1
	repeat with mySlide in theShow
		set theTitle to title of mySlide
		set theBody to body of mySlide
		set eachBullet to paragraphs of theBody
		set theNotes to ("(slide " & slide number of mySlide as string) & ") " & notes of mySlide
		set eachNote to paragraphs of theNotes
		
		tell application "TaskPaper"
			tell theDoc
				set theProject to make new project
				if theTitle is not "Double-click to edit" then
					set name of theProject to theTitle
				else
					set name of theProject to ""
				end if
				tell theProject
					repeat with i in eachBullet
						if i as string is not "Double-click to edit" then
							set theTask to make new task
							set text content of theTask to i
						end if
						
					end repeat
					repeat with i in eachNote
						set theNote to make new note
						set text content of theNote to i
					end repeat
				end tell
			end tell
		end tell
	end repeat
end tell
