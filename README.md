# Keynote to Text

A suite of Applescripts aimed at converting Keynote documents to text formats (Markdown, [Remark](http://gnab.github.io/remark/#1) Markdown, and Taskpaper), and back (Taskpaper only so far...).

The scripts for Markdown have comments and documentation.  The Taskpaper scripts don't, but should be pretty self-explanatory.

### Keynote version requirements:

These work with Keynote 5.3 (Keynote '09) but not with Keynote 6.  I plan to keep using Keynote 5.3 for the time being, not least because the Applescript dictionary has been changed in ways that broke these scripts.  Yet another reason to move towards a text-based solution.

Since I am using the trick described here to [keep Keynote 6 and Keynote 5.3 Applescript separate](https://discussions.apple.com/thread/5487564?tstart=0), some of the scripts refer to "Keynote 5.3" instead of "Keynote" in the tell commands.  Adjust according to the name of the Keynote 5.3 (i.e. Keynote '09) application file on your machine.

### To do:

- Finish CSS equivalents for the master slide types in Keynote
- Create styles to go along with them

## Other Useful Tools

[Taskpaper to Markdown](https://gist.github.com/ttscoff/511174)

[Markdown to Taskpaper](http://www.leancrew.com/all-this/2011/11/the-return-of-taskpaper/)

I had envisioned writing a Markdown to Keynote script but I think I will just convert md2tp where needed instead.  Taskpaper's Applescript understands the structure of the document which makes for less work than trying to parse the Markdown.


