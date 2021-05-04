---
date: 2021-04-29T20:42
---

# Replacing the web with something saner

This is a simplification, but let's say that basically there are just 3 kinds of websites:

1. Websites with content: text, images, videos;
2. Websites that run full apps that do a ton of interactive stuff;
3. Websites with some interactive content that uses JavaScript, or "mini-apps";

In a saner world we would have 3 different ways of serving and using these. 1 would be "the web" (and it was for a while, although I'm not claiming here that the past is always better and wanting to get back to the glorious old days).

1 would stay as "the web", just static sites, styled with CSS, no JavaScript whatsoever, but designers can still thrive and make they look pretty. Or it could also be something like [Gemini](https://gemini.circumlunar.space/). Maybe the two protocols could coexist.

2 would be downloadable native apps, much easier to write and maintain for developers (considering that multi-platform and cross-compilation is easy today and getting easier), faster, more polished experience for users, more powerful, integrates better with the computer.

(Remember that since no one would be striving to make the same app run both on browsers and natively no one would have any need for Electron or other inefficient bloated solutions, just pure native UI, like the Telegram app, have you seen that? It's fast.)

But 2 is mostly for apps that people use every day, something like Google Docs, email (although email is also broken technology), Netflix, Twitter, Trello and so on, and all those hundreds of niche SaaS that people pay monthly fees to use, each tailored to a different industry (although most of functions they all implement are the same everywhere). What do we do with dynamic open websites like StackOverflow, for example, where one needs to not only read, but also search and interact in multiple ways? What about that website that asks you a bunch of questions and then discovers the name of the person you're thinking about? What about that mini-app that calculates the hash of your provided content or shrinks your video, or that one that hosts your image without asking any questions?

All these and tons of others would fall into category 3, that of instantly loaded apps that you don't have to install, and yet they run in a sandbox.

The key for making category 3 worth investing time into is coming up with some solid grounds, simple enough that anyone can implement in multiple different ways, but not giving the app too much choices.

Telegram or Discord bots are super powerful platforms that can accomodate most kinds of app in them. They can't beat a native app specifically made with one purpose, but they allow anyone to provide instantly usable apps with very low overhead, and since the experience is so simple, intuitive and fast, users tend to like it and sometimes even pay for their services. There could exist a protocol that brings apps like that to the open world of (I won't say "web") domains and the websockets protocol -- with multiple different clients, each making their own decisions on how to display the content sent by the servers that are powering these apps.

Another idea is that of [Alan Kay](https://www.quora.com/Should-web-browsers-have-stuck-to-being-document-viewers/answer/Alan-Kay-11): to design a nice little OS/virtual machine that can load these apps and run them. Kinda like browsers are today, but providing a more well-thought, native-like experience and framework, but still sandboxed. And I add: abstracting away details about design, content disposition and so on.

---

These 3 kinds of programs could coexist peacefully. 2 are just standalone programs, they can do anything and each will be its own thing. 1 and 3, however, are still similar to browsers of today in the sense that you need clients to interact with servers and show to the user what they are asking. But by simplifying everything and separating the scopes properly these clients would be easy to write, efficient, small, the environment would be open and the internet would be saved.

## See also

- [[d5982f65]]
