# amazon-utils

**amazon-utils** is a collection of CLI programs designed to improve user experience on Amazon.com, Inc.’s retail websites.


## Warning

**This is alpha-quality software.** If you don’t know what this means, do not use any of the scripts in this collection.

If you do use amazon-utils, be advised that it is largely untested.


## System requirements

- To use amazon-utils, you need OS&nbsp;X 10.11 El Capitan, macOS 10.12 Sierra, or a later macOS version.

- You also need Google Chrome.

- You must have an account at Amazon.de.

- At this time, `amazon-utils` only supports Amazon.de. (PRs are welcome.)


## Installation

1. Make sure you have [Homebrew](https://brew.sh) installed.

2. Run `brew tap claui/public` if you haven’t already done so.

3. Run:

```
brew install amazon-utils
```


## amazon-chat

At this time, amazon-utils ships with just a single program, `amazon-chat`. When run, it **opens a chat window to talk to an Amazon.de representative.**

I wrote `amazon-chat` because whenever I need to talk to an Amazon.de representative, there are way too many steps involved in bringing up the chat window.


### Using amazon-chat

1. Open a Terminal app.

2. Type `amazon-chat` and press Enter. This opens a Google Chrome window.

3. The browser may ask for authentication. If it does, enter your credentials to log in.

4. **The chat window should now open automatically**. If no chat window appears, search the page for a problem description. Usually, the _Chat_ button has a description next to it that explains why it didn’t work.


## Legal notice

This suite of programs is in no way affiliated with, nor has it any connection to, nor is it being endorsed by, Amazon.com, Inc., or by any of its websites or subsidiaries.


## License

Copyright (c) 2018 Claudia <clau@tiqua.de>

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted, provided that the
above copyright notice and this permission notice appear in all
copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
