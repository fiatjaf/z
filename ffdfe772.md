---
date: 2019-08-08
---

# Eltoo

Read [the paper](https://blockstream.com/eltoo.pdf), it's actually nice and small. You can read only everything up to section 4.2 and it will be enough. Done.

Ok, you don't want to. Or you tried but still want to read here.

Eltoo is a way of keeping payment channel state that works better than the original scheme used in _Lightning_. Since Lightning is a bunch of different protocols glued together, it can It replace just the part the previously dealed with keeping the payment channel.

Eltoo works like this: A and B want a payment channel, so they create a multisig transaction with deposits from both -- or from just one, doesn't matter. That transaction is only spendable if both cooperate. So if one of them is unresponsive or non-cooperative the other must have a way to get his funds back, so they also create an **update** transaction but don't publish it to the blockchain. That update transaction spends to a **settlement** transaction that then distributes the money back to A and B as their balances say.

If they are cooperative they can change the balances of the channel by just creating new **update** transactions and **settlement** transactions and number them like 1, 2, 3, 4 etc.

![](/static/eltoo-drawing.png)

_Solid arrows means a transaction is presigned to spend only that previous other transaction; dotted arrows mean it's a floating transaction that can spend any of the previous._

## Why do they need and update and a settlement transaction?

Because if B publishes **update2** (in which his balances were greater) A needs some time to publish **update4** (the latest, which holds correct state of balances).

Each **update** transaction can be spent by any newer **update** transaction immediately or by its own specific **settlement** transaction only after some time -- or some blocks.

Hopefully you got that.

## How do they close the channel?

If they're cooperative they can just agree to spend the funding transaction, that first multisig transaction I mentioned, to whatever destinations they want. If one party isn't cooperating the other can just publish the latest **update** transaction, wait a while, then publish its **settlement** transaction.

## How is this better than the previous way of keeping channel states?

Eltoo is better because nodes only have to keep the last set of update and settlement transactions. Before they had to keep all intermediate state updates.

## If it is so better why didn't they do it first?

Because they didn't have the idea. And also because they needed an update to the Bitcoin protocol that allowed the presigned **update** transactions to spend any of the previous **update** transactions. This protocol update is called `SIGHASH_NOINPUT`[^anyprevout], you've seen this name out there. By marking a transaction with `SIGHASH_NOINPUT` it enters a mystical state and becomes a _floating transaction_ that can be bound to any other [[5f5112d7|transaction]] as long as its unlocking script matches the locking script.

## Why can't update2 bind itself to update4 and spend that?

Good question. It can. But then it can't anymore, because Eltoo uses `OP_CHECKLOCKTIMEVERIFY` to ensure that doesn't actually check not a locktime, but a sequence. It's all arcane stuff.

And then Eltoo **update** transactions are numbered and their lock/unlock scripts will only match if a transaction is being spent by another one that's greater than it.

## Do Eltoo channels expire?

No.

## What is that "on-chain protocol" they talk about in the paper?

That's just an example to guide you through how the off-chain protocol works. Read carefully or don't read it at all. The off-chain mechanics is different from the on-chain mechanics. Repeating: the on-chain protocol is useless in the real world, it's just a didactic tool.

[^anyprevout]: Later `SIGHASH_NOINPUT` was modified to fit better with Taproot and Schnorr signatures and renamed to `SIGHASH_ANYPREVOUT`.
