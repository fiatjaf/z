---
date: 2022-10-31T13:47
---

# The problem with ION

[ION](https://techcommunity.microsoft.com/t5/identity-standards-blog/ion-we-have-liftoff/ba-p/1441555) is a [[98aab9a5|DID method]] based on a thing called "Sidetree".

I can't say for sure what is the problem with ION, because I don't understand the design, even though I have read all I could and asked everybody I knew. All available information only touches on the high-level aspects of it (and of course its amazing wonders) and no one has ever bothered to explain the details. I've also asked the main designer of the protocol, Daniel Buchner, but he may have thought I was trolling him on Twitter and refused to answer, instead pointing me to an incomplete spec on the Decentralized Identity Foundation website that I had already read before. I even tried to join the DIF as a member so I could join their closed community calls and hear what they say, maybe eventually ask a question, so I could understand it, but my entrance was ignored, then after many months and a nudge from another member I was told I had to do a KYC process to be admitted, which I refused.

**One thing I know is**:

  - ION is supposed to provide a way to _rotate keys_ seamlessly and automatically without losing the main identity (and the ION proponents also claim there are no "master" keys because these can also be rotated).
  - ION is also _not a blockchain_, i.e. it doesn't have a deterministic consensus mechanism and it is decentralized, i.e. anyone can publish data to it, doesn't have to be a single central server, there may be holes in the available data and the protocol doesn't treat that as a problem.
  - From all we know about years of attempts to scale Bitcoins and develop offchain protocols it is clear that _you can't solve the double-spend problem without a central authority or a kind of blockchain_ (i.e. a decentralized system with deterministic consensus).
  - _Rotating keys also suffer from the double-spend problem_: whenever you rotate a key it is as if it was "spent", you aren't supposed to be able to use it again.

The logic conclusion of the 4 assumptions above is that ION is flawed: it can't provide the key rotation it says it can if it is not a blockchain.

## See also

- [[25a4c808]]
