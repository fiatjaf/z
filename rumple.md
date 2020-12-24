---
date: 2020-10-16T21:42
tags:
  - idea
---

# idea: Rumple

_a payments network based on trust channels_

This is the description of a Lightning-like network that will work only with credit or trust-based channels and exist alongside the normal Lightning Network. I imagine some people will think this is undesirable and at the same time very easy to do (such that if it doesn't exist yet it must be because no one cares), but in fact it is a very desirable thing -- which I hope I can establish below -- and at the same time a very non-trivial problem to solve, as the history of Ryan Fugger's Ripple project and posterior copies of it show.

Read these first to get the full context:

1. [[[dfd6b115]]]
2. [[[3cb7c325]]]
3. [[[e3624832]]]
4. [[[a675823c]]]

## Explanation about the name

Since we're copying the fundamental Ripple idea from Ryan Fugger and since the name "Ripple" is now associated with a scam coin called XRP, and since Ryan Fugger has changed the name of his old website "Ripplepay" to "Rumplepay", we will follow his lead here. If "Ripplepay" was the name of a centralized prototype to the open peer-to-peer network "Ripple", now that the centralized version is called "Rumplepay" the peer-to-peer version must be called "Rumple".

## Now the idea

Basically we copy the Lightning Network, but without HTLCs or channels being opened and closed with funds committed to them on multisig Bitcoin transactions published to the blockchain. Instead we use pure trust relationships like the original Ripple concept.

And we use [the blockchain commit method](http://ripple.ryanfugger.com/Protocol/BlockChainCommitMethod.html), but instead of spending an absurd amount of money to use the actual Bitcoin blockchain instead we use a parallel chain.

## How exactly -- a protocol proposal attempt

It could work like this:

### The parallel chain, or "Rumple Chain"

1. We define a parallel chain with a genesis block;
2. Following blocks must contain
    ```
    a. the ID of the previous block;
    b. a list of up to 32768 entries of arbitrary 32-byte values;
    c. an ID constituted by
        sha256(the previous block ID +
               the merkle root of all the entries)
    ```
3. To be mined, each parallel block must be included in the Bitcoin chain according [as explained above](a675823c).

Now that we have a structure for a simple "blockchain" that is completely useless, just blocks over blocks of meaningless values, we proceed to the next step of assigning meaning to these values.

### The off-chain payments network, or "Rumple Network"

1. We create a network of nodes that can talk to each other via TCP messages (all details are the same as the Lightning Network, except where mentioned otherwise);
2. These nodes can create trust channels to each other. These channels are backed by nothing except the willingness of one peer to pay the other what is owed.
3. When Alice creates a trust channel with Bob (`Alice trusts Bob`), contrary to what happens in the Lightning Network, it's A that can immediately receive payments through that channel, and everything A receives will be an IOU from Bob to Alice. So Alice should never open a channel to Bob unless Alice trusts Bob. But also Alice can choose the amount of trust it has in Bob, she can, for example, open a very small channel with Bob, which means she will only lose a few satoshis if Bob decides to exit scam her. (in the original Ripple examples these channels were always depicted as friend relationships, and they can continue being that, but it's expected -- given the experience of the Lightning Network -- that the bulk of the channels will exist between users and wallet provider nodes that will act as hubs).
4. As Alice receive a payment through her channel with Bob, she becomes a creditor and Bob a debtor, i.e., the balance of the channel moves a little to her side. Now she can use these funds to make payments over that channel (or make a payment that combines funds from multiple channels using [MPP](https://ln.dev/read/04-onion-routing#basic-multi-part-payments)).
5. If at any time Alice decides to close her channel with Bob, she can send all the funds she has standing there to somewhere else (for example, another channel she has with someone else, another wallet somewhere else, a shop that is selling some good or service, or a service that will aggregate all funds from all her channels and send a transaction to the Bitcoin chain on her behalf).
6. If at any time Bob leaves the network Alice is entitled by Bob's cryptographic signatures to knock on his door and demand payment, or go to a judge and ask him to force Bob to pay, or share the signatures and commitments online and hurt Bob's reputation with the rest of the network (but yes, none of these things is good enough and if Bob is a very dishonest person none of these things is likely to save Alice's funds).

### The payment flow

1. Suppose there exists a route `Alice->Bob->Carol` and Alice wants to send a payment to Carol.
2. First Alice reads an _invoice_ she received from Carol. The invoice (which can be pretty similar or maybe even the same as [BOLT11](https://ln.dev/read/11-payment-encoding)) contains a payment hash `h` and information about how to reach Carol's node, optionally an amount. Let's say it's 100 satoshis.
3. Using the routing information she gathered, Alice builds an onion and sends it to Bob, at the same time she offers to Bob a "conditional IOU". That stands for a signed commitment that Alice will owe Bob an 100 satoshis if in the next 50 blocks of the Rumple Chain there appears a block containing the preimage `p` such that `sha256(p) == h`.
4. Bob peels the onion and discovers that he must forward that payment to Carol, so he forwards the peeled onion and offers a conditional IOU to Carol with the same `h`. Bob doesn't know Carol is the final recipient of the payment, it could potentially go on and on.
5. When Carol gets the conditional IOU from Bob, she makes a list of all the nodes who have announced themselves as miners (which is not something I have mentioned before, but nodes that are acting as miners will must announce themselves somehow) and are online and bidding for the next Rumple block. Each of these miners will have previously published a random 32-byte value `v` they they intend to include in their next block.
6. Carol sends payments through routes to all (or a big number) of these miners, but this time the conditional IOU contains two conditions (values that must appear in a block for the IOU to be valid): `p` such that `sha256(p) == h` (the same that featured in the invoice) and `v` (which must be unique and constant for each miner, something that is easily verifiable by Carol beforehand). Also, instead of these conditions being valid for the next 50 blocks they are valid only for the single next block.
7. Now Carol broadcasts `p` to the mempool and hopes one of the miners to which she sent conditional payments sees it and, allured by the possibility of cashing in Carol's payment, includes `p` in the next block. If that does not happen, Carol can try again in the next block.

## Why bother with this at all?

1. **The biggest advantage of Lightning is its openness**

    It has been said multiple times that if trust is involved then we don't need Lightning, we can use Coinbase, or worse, Paypal. This is very wrong. Lightning is good specially because it serves as a bridge between Coinbase, Paypal, other custodial provider and someone running their own node. All these can transact freely across the network and pay each other without worrying about who is in which provider or setup.

    Rumple inherits that openness. In a Rumple Network

    Also, since Rumple payments are also based on the reveal of a preimage it can do swaps with Lightning inside a payment route from day 1 (by which I mean one can pay from Rumple to Lightning and vice-versa).

     ‎

3. **Rumple fixes Lightning's fragility**

    Lightning is too fragile.

    Some issues, like the [flood-and-loot](https://www.coindesk.com/bitcoins-lightning-network-is-vulnerable-to-looting-new-research-explains) attack, for example, although not an attack that's simple to execute, it's still dangerous even if failed. Given that risk, it's important to not ever open channels with random anonymous people. Some degree of trust must exist between peers.

    One does not even have to consider attacks. The creation of HTLCs is a liability that every node has to do multiple times during its life. Every initiated, received or forwarded payment require adding one HTLC then removing it from the commitment transaction. Every

    Another issue that makes trust needed between peers is the fact that channels can be closed unilaterally. Although this is a feature, it is also a bug when considering high-fee environments. Imagine you pay $10 in fees to open a channel, your peer may close that unilaterally in the next second and then you have to pay another $15 to close the channel. The opener pays (this is also a feature that [can double as a bug](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002804.html) by itself). Even if it's not you opening the channel, a peer can open a channel with you, make a payment, then clone the channel, and now you're left with, say, an output of 4200 satoshis, which is equal to zero if network fees are high.

    So you should only open channels with people you know and know aren't going to actively try to hack you and people who are not going to close channels and impose unnecessary costs on you. But even considering a fully trusted Lightning Network, even if -- to be extreme -- you only opened channels with yourself, these channels would still be fragile. If some HTLC get stuck for any reason (peer offline or some weird small incompatibility between node softwares) and you're forced to close the channel because of that, there are the extra costs of sweeping these UTXO outputs plus the total costs of closing and reopening a channel that shouldn't have been closed in the first place. Even if HTLCs don't get stuck, [a fee renegotiation during a mempool spike](https://twitter.com/renepickhardt/status/1321862538859073548) may cause channels to force-close, become valueless or settle for very high closing fee.

    Some of these issues are mitigated by Eltoo, others by only having channels with people you trust. Others referenced above, plus the [the griefing attack](https://twitter.com/joostjgr/status/1308414364911841281) and in general the ability of anyone to spam the network for free with payments that can be pending forever or a lot of payments fail repeatedly makes it very fragile.

    Rumple solves most of these problems by not having to touch the blockchain at all. Fee negotiation makes no sense. Opening and closing channels is free. Flood-and-loot is a non-issue. The griefing attack can be still attempted as funds in trust channels must be reserved like on Lightning, but since there should be no theoretical limit to the number of prepared payments a channel can have, the griefing must rely on actual amounts being committed, which prevents large attacks from being performed easily.

     ‎

4. **Rumple fixes Lightning's unsolvable reputation issues**

    In the Lightning Conference 2019, Rusty Russell promised there would be pre-payments on Lightning someday, since everybody was aware of potential spam issues and pre-payments would be the way to solve that. Fast-forward to November 2020 and these pre-payments have become an [apparently unsolvable problem](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-October/002826.html)[^thread-402]: no one knows how to implement them reliably without destroying privacy completely or introducing worse problems.

    Replacing these payments with tables of reputation between peers is also an unsolved problem[^reputation-lightning], for the same reasons explained in the thread above.

     ‎

5. **Rumple solves the hot wallet problem**

    Since you don't have to use Bitcoin keys or sign transactions with a Rumple node, only your channel trust is at risk at any time.

     ‎

6. **Rumple ends custodianship**

    Since no one is storing other people's funds, a big hub or wallet provider can be used in multiple payment routes, but it cannot be immediately classified as a "custodian". At best, it will be a big debtor.

     ‎

7. **Rumple is fun**

    Opening channels with strangers is boring. Opening channels with friends and people you trust even a little makes that relationship grow stronger and the trust be reinforced.
    (But of course, like it happens in the Lightning Network today, if Rumple is to be successful the bulk of trust will be from isolated users to big reliable hubs.)

## Questions or potential issues

1. **So many advantages, yes, but trusted? Custodial? That's easy and stupid!**

    Well, an enormous part of the current Lightning Network (and also onchain Bitcoin wallets) already rests on trust, mainly trust between users and custodial wallet providers like BlueWallet, WalletofSatoshi and others. Worse: on the current Lightning Network users not only trust, they also expose their entire transaction history to these providers[^hosted-channels].

    Besides that, as detailed in point 3 of the previous section, there are many unsolvable issues on the Lightning protocol that make each sovereign node dependent on some level of trust in its peers (and the network in general dependent on trusting that no one else will spam it to death).

    So given the current state of the Lightning Network, to trust peers like Rumple requires is not a giant change -- but it is still a significant change: in Rumple you shouldn't open a large trust channel with someone just because it looks trustworthy, you must personally know that person and only put in what you're willing to lose. In known brands that have reputation to lose you can probably deposit more trust, same for long-term friends, and that's all. Still it is probably good enough, given the existence of MPP payments and the fact that the purpose of Rumple is to be a payments network for day-to-day purchases not a way to buy real estate.

     ‎

2. **Why would anyone run a node in this parallel chain?**

    I don't know. Ideally every server running a Rumple Network node will be running a Bitcoin node and a Rumple Chain node. Besides using it to confirm and publish your own Rumple Network transactions it can be set to mine automatically on the Bitcoin chain and maybe earn some change comparable to running a Lightning routing node or a JoinMarket Yield Generator.

    Also it must be really lightweight, as pruning is completely free and no verification-since-the-genesis-block will take place.

    ‎

10. **What is the maturity of the debt that exists in the Rumple Network or its legal status?**

    By default it is to be understood as being payable on demand for payments occurring inside the network (as credit can be used to forward or initiate payments by the creditor using that channel). But details of settlement outside the network or what happens if one of the peers disappears cannot be enforced or specified by the network.

    Perhaps negotiated some standard optional settlement methods (like a Bitcoin address) can be announced and negotiated upon channel creation inside the protocol, but nothing more than that.

[^thread-402]: Read at least the first 10 messages of the thread to see how naïve proposals like you and me could have thought about are brought up and then dismantled very carefully by the group of people most committed to getting Lightning to work properly.
[^reputation-lightning]: See also the footnote at [[3cb7c325]].
[^hosted-channels]: Although that second part can be solved by [hosted channels](https://gist.github.com/btcontract/d4122a79911eef2620f16b3dfe2850a8).
