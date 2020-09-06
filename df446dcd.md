---
date: 2018-01-01
tags:
  - criticisms
  - ethereum
---

# Token-Curated Registries

## So you want to build a TCR?

TCRs (Token Curated Registries) are a construct for maintaining registries on Ethereum. Imagine you have lots of scissor brands and you want a list with only the good scissors. You want to make sure only the good scissors make into that list and not the bad scissors. For that, people will tell you, you can just create a TCR of the best scissors!

It works like this: some people have the token, let's call it Scissor Token. Some other person, let's say it's a scissor manufacturer, wants to put his scissor on the list, this guy must acquire some Scissor Tokens and "stake" it. Holders of the Scissor Tokens are allowed to vote on "yes" or "no". If "no", the manufactures loses his tokens to the holders, if "yes" then its tokens are kept in deposit, but his scissor brand gets accepted into the registry.

Such a simple process, they say, have strong incentives for being the best possible way of curating a registry of scissors: consumers have the incentive to consult the list because of its high quality; manufacturers have the incentive to buy tokens and apply to join the list because the list is so well-curated and consumers always consult it; token holders want the registry to accept good and reject bad scissors because that good decisions will make the list good for consumers and thus their tokens more valuable, bad decisions will do the contrary. It doesn't make sense, to reject everybody just to grab their tokens, because that would create an incentive against people trying to enter the list.

Amazing! How come such a simple system of voting has such enourmous features? Now we can have lists of everything so well-curated, and for that we just need Ethereum tokens!

Now let's imagine a different proposal, of my own creation: SPCR, Single-person curated registries.

Single-person Curated Registries are equal to TCR, except they don't use Ethereum tokens, it's just a list in a text file kept by a single person. People can apply to join, and they will have to give the single person some amount of money, the single person can reject or accept the proposal and so on.

Now let's look at the incentives of SPCR: people will want to consult the registry because it is so well curated; vendors will want to enter the registry because people are consulting it; the single person will want to accept the good and reject the bad applicants because these good decisions are what will make the list valuable.

Amazing! How such a single proposal has such enourmous features! SPCR are going to take over the internet!


## What TCR enthusiasts get wrong?

TCR people think they can just list a set of incentives for something to work and assume that something will work. Mix that with Ethereum hype and they think theyve found something unique and revolutionary, while in fact they're just making a poor implementation of "democracy" systems that fail almost everywhere.

The life is not about listing a set of "incentives" and then considering the problems solved. Almost everybody on the Earth has the incentive for being rich: being rich has a lot of advantages over being poor, however not all people get rich! Why are the incentives failing?

Curating lists is a hard problem, it involves a lot of knowledge about the problem that just holding a token won't give you, it involves personal preferences, politics, it involves knowing where is the real limit between "good" and "bad". The Single Person list may have a good result if the single person doing the curation is knowledgeable and honest (yes, you can game the system to accept your uncle's scissors and not their competitor that is much better, for example, without losing the entire list reputation), same thing for TCRs, but it can also fail miserably, and it can appear to be good but be in fact not so good. In all cases, the list entries will reflect the preferences of people choosing and other things that aren't taken into the incentives equation of TCR enthusiasts.


## We don't need lists

The most important point to be made, although unrelated to the incentive story, is that we don't need lists. Imagine you're looking for a scissor. You don't want someone to tell if scissor A or B are "good" or "bad", or if A is "better" than B. You want to know if, for your specific situation, or for a class of situations, A will serve well, and do that considering A's price and if A is being sold near you and all that.

Scissors are the worst example ever to make this point, but I hope you get it. If you don't, try imagining the same example with schools, doctors, plumbers, food, whatever.

Recommendation systems are badly needed in our world, and TCRs don't solve these at all.
