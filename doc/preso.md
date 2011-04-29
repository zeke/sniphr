Title: Sniphr
Author: 
Subtitle: a crowdsourced context collector
Company:

What is Sniphr?
===============

- a crowdsourced context collector
- an FRD lasso
- a passive bookmarking tool
- a tool for human validation of R&D stuff
- a tool that shouldn't be called sniphr any more

Origins
=======

![Extracting what matters](http://cl.ly/6H4p/Screen_shot_2011-04-26_at_2.34.59_PM.png)

Matterhorn
==========

A better name for what Sniphr has become.

![Matterhorn](http://cl.ly/6HRt/Screen_shot_2011-04-26_at_2.37.19_PM.png)

Setup
=====

Simple. Go to [sniphr.com](http://sniphr.com).

FRDs
====

![frd1](http://cl.ly/6IZx/Screen_shot_2011-04-27_at_8.13.11_PM.png)
![frd2](http://cl.ly/6J65/Screen_shot_2011-04-27_at_8.12.21_PM.png)

Little Sniphs
=============

- trending words
- words people are about to look up
- named entities

Mullet Architecture 
===================

	def mullet
	 business = "javascript"
	 party = "JSON API"
	 "#{business} in the front, #{party} in the back"
	end

The Chrome Client
=================

- Nothing but static JS/HTML
- As low-level/general purpose/agnostic as possible.
- Options window is a remote iframe

Oh, Auth.
=========

- What is OAuth? Let's ask sniphr: [sniphr.com/sniphs?q=OAuth](http://sniphr.com/sniphs?q=OAuth)
- All the [cool kids](https://github.com/intridea/omniauth) are doing it.
- Essential for Javascript-powered apps (mobile, web-based)
- Wordnik should be doing it

Fin
===

- Please try out sniphr and give me feedback!
- Rails source: [github.com:zeke/sniphr.git](http://github.com:zeke/sniphr.git)
- Chrome extension source: [github.com:zeke/sniphr-chrome.git](http://github.com:zeke/sniphr.git)
- Made with [Slide Show (s9)](http://slideshow.rubyforge.org/).