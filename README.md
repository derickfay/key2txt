# Keynote to Text

A suite of Applescripts aimed at converting Keynote documents to text formats (Markdown, [Remark](http://gnab.github.io/remark/#1) Markdown, and Taskpaper), and back (Taskpaper only so far...).

The scripts for Markdown have comments and documentation.  The Taskpaper scripts don't, but should be pretty self-explanatory.  They require TaskPaper 2, as TaskPaper 3 has dropped Applescript support.  (But there is a version for TP 3 in [this thread](http://support.hogbaysoftware.com/t/applescript-support-in-taskpaper-3/1309/8?u=derickfay).

### Keynote version requirements:

The scripts with k2 in the filename are preliminary conversions to Keynote 6.

The scripts with key2 in the filename work with Keynote 5.3 (Keynote '09) but not with Keynote 6.

Since I am using the trick described here to [keep Keynote 6 and Keynote 5.3 Applescript separate](https://discussions.apple.com/thread/5487564?tstart=0), some of the scripts refer to "Keynote 5.3" instead of "Keynote" in the tell commands.  Adjust according to the name of the Keynote 5.3 (i.e. Keynote '09) application file on your machine.

### To do:

I am going to concentrate on improving export to Remark Markdown

- Finish CSS equivalents for the master slide types in Keynote
- change existing CSS conversion to center titles only, rather than center entire slide then left-justify content
- Create styles to go along with them

## Other Useful Tools

[Taskpaper to Markdown](https://gist.github.com/ttscoff/511174)

[Markdown to Taskpaper](http://www.leancrew.com/all-this/2011/11/the-return-of-taskpaper/)

I had envisioned writing a Markdown to Keynote script but I think I will just convert md2tp where needed instead.  Taskpaper's Applescript understands the structure of the document which makes for less work than trying to parse the Markdown.


