---
date: 2020-09-04T16:53
tags:
  - bitcoin
---

# Drivechain

Drivechain is sidechain privatization.

Understanding Drivechain requires a shift from the paradigm most bitcoiners are used to. It is not about "trustlessness" or "mathematical certainty", but game theory and incentives.  (Well, Bitcoin in general is also that, but people prefer to ignore it and focus on some illusion of trustlessness provided by mathematics.)

Here we will describe the basic mechanism (simple) and incentives (complex) of ["hashrate escrow"](https://github.com/bitcoin/bips/blob/master/bip-0300.mediawiki) and how it enables a 2-way peg between the mainchain (Bitcoin) and various sidechains.

The full concept of "Drivechain" also involves blind merged mining (i.e., the sidechains mine themselves by publishing their block hashes to the mainchain without the miners having to run the sidechain software), but this is much easier to understand and can be accomplished either by [the BIP-301 mechanism](https://github.com/bitcoin/bips/blob/master/bip-0301.mediawiki) or by [the Spacechains mechanism](https://gist.github.com/RubenSomsen/5e4be6d18e5fa526b17d8b34906b16a5).

## How does hashrate escrow work from the point of view of Bitcoin?

A new address type is created. Anything that goes in that is locked and can only be spent if all miners agree on the Withdraw Transaction (WT^) that will spend it for 6 months. There is one of these special addresses for each sidechain.

To gather miners' agreement `bitcoind` keeps track of the "score" of all transactions that could possibly spend from that address. On every block mined, for each sidechain, the miner can use a portion of their coinbase to either increase the score of one WT^ by 1 while decreasing the score of all others by 1; or they can decrease the score of all transactions by 1; or they can do nothing.

Once a transaction has gotten a score high enough, it is published and funds are effectively transferred from the sidechain to their users.

If a timeout of 6 months passes and the score doesn't meet the threshold, that WT^ is discarded.

## What does the above procedure _mean_?

It means that people can transfer coins from the mainchain to a sidechain by depositing to the special address. Then they can withdraw from the sidechain by making a special withdraw transaction in the sidechain.

The special transaction somehow freezes funds in the sidechain while a transaction that aggregates all withdrawals into a single mainchain WT^, which is then submitted to the mainchain miners so they can start voting on it and finally after some months it is published.

Now the crucial part: _the validity of the WT^ is not verified by the Bitcoin mainchain rules_, i.e., if Bob has requested a withdraw from the sidechain to his mainchain address, but someone publishes a wrong WT^ that instead takes Bob's funds and sends them to Alice's main address there is no way the mainchain will know that. What determines the "validity" of the WT^ is the miner vote score and only that. It is the job of miners to vote correctly -- and for that they may want to run the sidechain node in SPV mode so they can attest for the existence of a reference to the WT^ transaction in the sidechain blockchain (which then ensures it is valid), or do so by some other means.

## What? 6 months to get my money back?

Yes. But no, in practice anyone who wants their money back will be able to use an atomic swap, submarine swap or other similar service to transfer funds from the sidechain to the mainchain and vice-versa. The long delayed withdraw costs would be incurred by few liquidity providers that would gain some small profit from it.

## Why bother with this at all?

Drivechains solve many different problems:

### It enables experimentation and new use cases for Bitcoin:

Issued assets, fully private transactions, stateful blockchain contracts, turing-completeness, decentralized games, some "DeFi" aspects, prediction markets, futarchy, decentralized and yet meaningful human-readable names, big blocks with a ton of normal transactions on them, a chain optimized only for Lighting-style networks to be built on top of it.

These are some ideas that may have merit to them, but were never _actually_ tried because they couldn't be tried with real Bitcoin or inferfacing with real bitcoins. They were either relegated to the shitcoin territory or to custodial solutions like Liquid or RSK that may have failed to gain network effect because of that.

### It solves conflicts and infighting:

Some people want fully private transactions in a UTXO model, others want "accounts" they can tie to their name and build reputation on top; some people want simple multisig solutions, others want complex code that reads a ton of variables; some people want to put all the transactions on a global chain in batches every 10 minutes, others want off-chain instant transactions backed by funds previously locked in channels; some want to spend, others want to just hold; some want to use blockchain technology to solve all the problems in the world, others just want to solve money.

With Drivechain-based sidechains all these groups can be happy simultaneously and don't fight. Meanwhile they will all be using the same money and contributing to each other's ecosystem even unwillingly, it's also easy and free for them to change their group affiliation easily later.

### It solves "scaling":

Multiple chains like the ones described above would certainly do a lot to accomodate many more transactions that the current Bitcoin chain can. I'm specially fond of the idea of having special Lightning Network special chains, but even just big block chains or big-block-mimblewimble chains or whatnot can probably do a good job. Or even something less cool like 200 independent chains (and you can call it "sharding") just like Bitcoin is today, no extra features, already multiply the current total capacity by 200.

Use your imagination.

### It solves the blockchain security budget issue:

The calculation is simple: you imagine what security budget is reasonable for each block in a world without block subsidy and divide that for the amount of bytes you can fit in a single block: that is the price to be paid in _satoshis per byte_. In reasonable estimative, the price necessary for every Bitcoin transaction goes to very large amounts, such that not only any day-to-day transaction has insanely prohibitive costs, but also Lightning channel opens and closes are impracticable.

So without a solution like Drivechain you'll be left with only one alternative: pushing Bitcoin usage to trusted services like Liquid and RSK or custodial Lightning wallets. With Drivechain, though, we could have all transactions happening in sidechains and being all aggregated into a sidechain block that pays a very large fee to be published (via blind merged mining) to the mainchain.

### It keeps Bitcoin decentralized

Once we have sidechains to accomodate the normal transactions, the mainchain functionality can be reduced to be only a "hub" for the sidechains' comings and goings, and then the maximum block size for the mainchain can be reduced to, say, 100kb, which would make running a full node very very easy.

## Can miners steal?

Yes. If a group of coordinated miners are able to secure the majority of the hashpower and keep their coordination for 6 months, they can publish a WT^ that takes the money from the sidechains and pays to themselves.

## Will miners steal?

No, because the incentives are such that they won't.

Although it may look at first that stealing is an obvious strategy for miners as it is free money, there are many other costs involved:

  1. The cost of **ceasing blind-merged mining returns** -- as stealing will kill a sidechain, all the fees from it that miners would be expected to earn for the next years are gone;
  2. The cost of **community goodwill** -- when participating in a steal operation, a miner will suffer a ton of backlash from the community, which is not something to be ignored. If they are public entities they can be physically harassed, receive death threats, or be persecuted by the State justice system;
  3. The cost of coordination -- assuming miners are just normal businesses, they just want to do their work and get paid, but stealing from a Drivechain will require coordination with other miners in a way that has many pitfalls and is likely to be broken over the months;
  4. The cost of miners leaving your mining pool: when we talked about "miners" above we were actually talking about mining pools operators, so they must also consider the risk of miners migrating from their mining pool to others as they begin the process of stealing;
  5. The cost of Bitcoin price going down: If a steal is successful that will mean Drivechains are not safe, therefore Bitcoin is less useful, and miner credibility will also be hurt, which are likely to cause the Bitcoin price to go down, which in turn may kill the miners' businesses and savings;
  6. Another small way the **community goodwill** can end up affecting self-interested miners is that if they attempt to steal, even if failing at the end, that will contribute to growing concerns over exaggerated miners power over the Bitcoin ecosystem, which may end up causing the community to agree on a hard-fork to change the mining algorithm in the future, or to do something to increase participation of more entities in the mining process (such as development or cheapment of new ASICs), which have a chance of decreasing the profits of current miners.

Another point to take in consideration is that one may be inclined to think a newly-created sidechain or a sidechain with relatively low usage may be more easily stolen from, since the blind merged mining returns from it (point 1 above) are going to be small -- but the fact is also that a sidechain with small usage will also have less money to be stolen from, and since the other costs besides 1 are less elastic at the end it will not be worth stealing from these too.

All of the above consideration are valid only if miners are stealing from _good sidechains_. If there is a sidechain that is doing things wrong, scamming people, not being used at all, or is full of bugs, for example, that will be perceived as a bad sidechain, and then miners can and will safely steal from it and kill it, which will be perceived as a good thing by everybody.

## What do we do if miners steal?

Paul Sztorc has suggested in the past that a user-activated soft-fork could prevent miners from stealing, i.e., most Bitcoin users and nodes issue a rule [similar to this one](https://twitter.com/LukeDashjr/status/1126221228182843398) to invalidate the inclusion of a faulty WT^ and thus cause any miner that includes it in a block to be relegated to their own Bitcoin fork that other nodes won't accept.

This suggestion has made people think Drivechain is a sidechain solution backed by user-actived soft-forks for safety, which is very far from the truth. Drivechains must not rely on this kind of soft-fork, although they are possible, as the coordination costs are too high and we don't ever expect them to happen.

If even with all the incentives against them doing it miners still steal from the sidechain that will mean the failure of the Drivechain experiment. It will very likely also mean the failure of the Bitcoin experiment too, as it will be proven that miners can coordinate to act maliciously over a prolonged period of time regardless of economic incentives, meaning they are probably in it for attacking Bitcoin anyway, backed by nation-states or something else, and therefore no Bitcoin transaction in the mainchain is to be expected to be safe ever again.

## Why use this and not a full-blown trustless and open sidechain technology?

Because it is impossible.

If you ever heard someone saying "just use a sidechain", "do this in a sidechain" or anything like that, be aware that these people are either talking about "federated" sidechains (i.e., funds are kept in custody by a group of entities) or they are talking about Drivechain, or they are disillusioned and think it is possible to do sidechains in any other manner.

### No, I mean a trustless 2-way peg with correctness of the withdrawals verified by the Bitcoin protocol!

That is not possible unless Bitcoin verifies all transactions that happen in all the sidechains, which would be akin to drastically increasing the blocksize and expanding the Bitcoin rules in tons of ways, i.e., a terrible idea that no one wants.

### What about the Blockstream sidechains whitepaper?

Yes, that was a way to do it using SPV proofs. The Drivechain hashrate escrow is a conceptually simpler way to achieve the same thing with improved incentives.

## Isn't the hashrate escrow a very complex soft-fork?

Yes, but it is simpler than SegWit. And, unlike SegWit, it doesn't force anything on users, i.e., it isn't a mandatory blocksize increase.

---

## See also

* [[0fbc9fa6]]
* [[e4480e82]]
