---
date: 2023-08-17T13:31
tags:
  - bitcoin
---

# The place of Drivechain in Bitcoin's future

James O'Beirne wrote this [nice little article](https://delvingbitcoin.org/t/thoughts-on-scaling-and-consensus-changes-2023/32) that contains a bunch of statements that should have been obvious to anyone who thought a little about Bitcoin's future, as they were obvious for Hal Finney in 2009 already.

Basically the article says that the Bitcoin blockchain won't scale for the entire world population to use it. It will so much not scale that even "offchain" solutions like Lightning and Ark will not scale and they basically lose usefulness as more adoption happens and fees rise.

Given that, Bitcoin has only two paths (and now this is not James speaking anymore): either it will die or it will have to scale using custodians.

## Can Bitcoin die?

Yes, Bitcoin can die, and if Bitcoin fails to get some level of mass adoption soon enough I believe it will die. Governments all around the world gave us 14 years of advantage to try to get Bitcoin to become this money medium-of-exchange store-of-value thing, or at least an investment vehicle or savings-technology that is super valuable and with widespread ownership, but now it is starting to move. CBDCs have been talked about for a while, but now they are really starting to happen. Regulated and compliant fiat proprietary services like Venmo have grown under capture by governments, in some places the government itself has launched their own cool app-like totally regulated spyware fiat money transmission things, like the ridiculous PIX in Brazil, which is now widely adopted, and -- I believe surprisingly for all the UX designers out there -- people have learned to use QR codes.

The point is that, given a little bit of more time, governments can start to encroach on Bitcoin's space, making it more and more regulated until it either dies or becomes a very useless thing. Some Bitcoiners think Bitcoin has already won, this can't be further from the truth. Others think Bitcoin must not be mass adopted, it must stay as this niche and mostly useless currency digital asset thing or I don't really understand what they think. These people are wrong. There are also people who think Bitcoin should not be used by normal people as money, it should keep being adopted, but only as a store-of-value: this is also completely wrong, since Bitcoin's value tends to decrease as soon as owners realize Bitcoin is losing its chances of becoming actual money.

## Scaling

To not die, Bitcoin must become more used. The current thesis accepted by most "maximalists" is that Bitcoin will continue to be thought of as an investment and its price will keep increasing, the price movements will bring more attention to it in a virtuous cycle. Eventually enough people will _want_ to hold it so they will start accepting it as a payment for goods and services and then it can start to be used as money.

Assuming that will happen, we'll be faced with a problem: as people try to use it as money they will necessarily, by lack of other options, have to use some custodial solution or some proto-custodial solution, maybe using Lightning as a settlement layer between big custodians[^1]? I don't know. No one is happy with that solution, and rightfully so, since it is very dangerous. A small set of custodians can easily be captured by governments and they can slowly turn Bitcoin into fiat money like they did with gold.

In other words: without Drivechain, Bitcoin will be a fragile success in the best case and dead in the worst case scenario.

## Enter Drivechain

[[drivechain|Drivechain]] basically brings two things to the table:

In the best case scenario of the non-Drivechain world, we would be in a fragile position with easily-capturable custodians. With Drivechain, we can create a bunch of decentralized sidechains, backed by the same mining process that is assumed to be decentralized already for Bitcoin to even work, and we gain orders of magnitude of more room to make censorship-resistant open transactions that don't require tax IDs or selfies and can't be stopped or regulated by governments. Bitcoin can scale as it normally would, but it's much more resilient.

The other thing we get are improvements for the "dying" part. If Drivechain is successful, it may end up bringing much more people to Bitcoin. [Hivemind](https://bitcoinhivemind.com/) by itself may attract lots of users and capital that has been prevented from betting on predictions anywhere in the fiat world since always; Zcash or Monero sidechains can easily bring all the "cryptocurrency" enthusiasts that care about privacy and have long ago decided that Bitcoin isn't for them, these people are interested in some immediate feature, that now Bitcoin can provide them with; other sidechains, like Ethereum-like chains, can also contribute to [[95b92312|slowly bring in some of the users]] of these chains[^2]. Why would we want these people to come to Bitcoin? Because they will increase Bitcoin's network-effect, increase the satoshi price, and these changes would contribute for more people to start looking at Bitcoin and using Bitcoin and so on and so forth. More users, more network-effect, bigger price, will contribute for Bitcoin not being easily regulated and killed by governments.

In other words: with Drivechain will be a resilient success in the worst case and a complete and total world dominator money in the best case.


[^1]: I actually think Bitcoiners should put more thought on how to create a custodian network that scales easily without having to be centralized in a small set of providers like [[04e9e814|Lightning]] is, and this is kind of the point of James's article too.
[^2]: Yes, I do think the entirety of the Ethereum ecosystem is a waste of time and money, but clearly there are dozens of people and money that disagree with me. And if they can't harm me with their stupidity then they will definitely make our money stronger. Besides that, it's not as if there aren't already many stupid people or even evil, horrible criminals using Bitcoin.
