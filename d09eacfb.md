---
date: 2022-04-23T19:17
---

# `OP_CHECKTEMPLATEVERIFY` and the "covenants" drama

There are many ideas for "covenants" (I don't think this concept helps in the specific case of examining proposals, but fine). Some people think "we" (it's not obvious who is included in this group) should somehow examine them and come up with the perfect synthesis.

It is not clear what form this magic gathering of ideas will take and who (or which ideas) will be allowed to speak, but suppose it happens and there is intense research and conversations and people (ideas) really enjoy themselves in the process.

What are we left with at the end? Someone has to actually commit the time and put the effort and come up with a concrete proposal to be implemented on Bitcoin, and whatever the result is it will have trade-offs. Some great features will not make into this proposal, others will make in a worsened form, and some will be contemplated very nicely, there will be some extra costs related to maintenance or code complexity that will have to be taken. Someone, a concreate person, will decide upon these things using their own personal preferences and biases, and many people will not be pleased with their choices.

Now what happens? Either that person's proposal will be said to be the best possible thing and in "rough consensus" and everybody will accept it; or it will be deemed not-good-enough and ignored. The crux of the current debate regarding `OP_CHECKTEMPLATEVERIFY` is to understand why Jeremy Rubin's proposal, which can be considered one of the possible proposals for implementing "covenants" on Bitcoin (one that examines many different possibilities proposed by many other people and makes some choices taking pros and cons in consideration) is being considered not-good-enough.

Whether the cause of Jeremy Rubin receiving such treatment is that he doesn't have the biggest bitcoincory aura and is not friends with the people that have the aura or that most people don't like his choices and would have preferred other choices doesn't really matter. The fact is that suggesting "more talk", "more research", "more cooperation", "more examination of other possibilities" won't help if after the end of such extra research (because yes, a lot of research has already been made) someone else comes up with yet another proposal that doesn't meet the necessary criteria for acceptance. It is extra cruel to suggest that Jeremy Rubin himself should be the one initiating all these talks and then changing his own proposal and rewriting his code and his tests -- to then discover that his next proposal won't be deemed good enough either because of some other hidden criteria.

One problem Bitcoin is facing right now is that a proposal is being rejected and no one knows why, and the people who are rejecting it are saying things and making suggestions that indicate they really have no idea, because the criteria is not clear to them or to anyone.

The other big problem is that no one else is willing to make any other proposal -- by which I mean not thrown out ideas, but actual code and specification and tests and use cases. If another proposal existed perhaps that wouldn't help much in clarifying the criteria for acceptance, but at least we would have one extra chance of getting _anything_ activated on Bitcoin, and Jeremy Rubin would be finally able to rest.
