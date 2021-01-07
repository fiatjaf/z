---
date: 2020-09-21T02:04
tags:
  - bitcoin
---

# `bitcoind` decentralization

It is better to have multiple curator teams, with different vetting processes and release schedules for `bitcoind` than a single one.

"More eyes on code", "Contribute to Core", "Everybody should audit the code".

All these points repeated again and again fell to Earth on the day it was discovered that Bitcoin Core developers merged a variable name change from "blacklist" to "blocklist" without even discussing or acknowledging the fact that that innocent pull request opened by a sybil account was a social attack.

After a big lot of people manifested their dissatisfaction with that event on Twitter and on GitHub, most Core developers simply ignored everybody's concerns or even personally attacked people who were complaining.

The event has shown that:

1) Bitcoin Core ultimately rests on the hands of a couple maintainers and they decide what goes on the GitHub repository[^pr-merged-very-quickly] and the binary releases that will be downloaded by thousands;
2) Bitcoin Core is susceptible to social attacks;
2) "More eyes on code" don't matter, as these extra eyes can be ignored and dismissed.

## Solution: **`bitcoind` decentralization**

If usage was spread across 10 different `bitcoind` flavors, the network would be much more resistant to social attacks to a single team.

This has nothing to do with the question on if it is better to have multiple different Bitcoin node implementations or not, because here we're basically talking about the same software.

Multiple teams, each with their own release process, their own logo, some subtle changes, or perhaps no changes at all, just a different name for their `bitcoind` flavor, and that's it.

Every day or week or month or year, each flavor merges all changes from Bitcoin Core on their own fork. If there's anything suspicious or too leftist (or perhaps too rightist, in case there's a leftist `bitcoind` flavor), maybe they will spot it and not merge.

This way we keep the best of both worlds: all software development, bugfixes, improvements goes on Bitcoin Core, other flavors just copy. If there's some non-consensus change whose efficacy is debatable, one of the flavors will merge on their fork and test, and later others -- including Core -- can copy that too. Plus, we get resistant to attacks: in case there is an attack on Bitcoin Core, only 10% of the network would be compromised. the other flavors would be safe.

## Run Bitcoin Knots

The first example of a `bitcoind` software that follows Bitcoin Core closely, adds some small changes, but has an independent vetting and release process is [Bitcoin Knots][knots], maintained by the incorruptible Luke DashJr.

Next time you decide to run `bitcoind`, run Bitcoin Knots instead and contribute to `bitcoind` decentralization!

---

### See also:

- [[2873aa84]]

[^pr-merged-very-quickly]: See [PR 20624](https://github.com/bitcoin/bitcoin/pull/20624], for example, a very complicated change that [could be introducing bugs or be a deliberate attack](http://www.erisian.com.au/wordpress/2021/01/07/bitcoin-in-2021), merged in 3 days without time for discussion.

[knots]: https://bitcoinknots.org/
