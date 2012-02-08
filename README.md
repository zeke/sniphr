Sniphr
======

This is the rails application that powers [sniphr.com](http://sniphr.com).

API
---

*Retrieving Sniphs*

- [GET sniphr.com/sniphs.json](http://sniphr.com/sniphs.json) gives you the latest sniphs.
- [GET sniphr.com/sniphs.json?per_page=50&page=2](http://sniphr.com/sniphs.json?per_page=50&page=2) to paginate.
- [GET sniphr.dev/sniphs/2660.json](http://sniphr.com/sniphs/2660.json) for a specific sniph.

*Creating Sniphs*

An HTTP purist would say that sniphs should be created by POSTs, and they'd be right, but
in the current API, GET is used to accommodate the sniphr chrome extension's Ajax implemenation,
which doesn't currently support GETs.

The base URL:

    http://sniphr.dev/sniphs/save.json

The API expects an object of this structure:

    {
      sniph: {
        url: "http://www.thefoxwebsite.org",
        title: "The fox website",
        content: "Welcome to the fox website."
      }
    }

The request should be URL encoded, and will look something like this:

    http://sniphr.dev/sniphs/save.json?sniph%5Burl%5D=http%3A%2F%2Fwww.thefoxwebsite.org%2F&sniph%5Btitle%5D=The+fox+website%3A+one+site+with+all+the+answers+about+foxes&sniph%5Bcontent%5D=Welcome+to+the+fox+website
    
