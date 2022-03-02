---
date: 2021-08-09
---

bolt12 problems
===============

- clients can't programatically build new offers by changing a path or query params (services like zbd.gg or lnurl-pay.me won't work)
- impossible to use in a load-balanced custodian way -- since offers would have to be pregenerated and tied to a specific lightning node.
- the existence of fiat currency fields makes it so wallets have to fetch exchange rates from somewhere on the internet (or offer a bad user experience), using HTTP which hurts user privacy.
- the vendor field is misleading, can be phished very easily, not as safe as a domain name.
- onion messages are an improvement over fake HTLC-based payments as a way of transmitting data, for sure. but we must decide if they are (i) suitable for transmitting all kinds of data over the internet, a replacement for tor; or (ii) not something that will scale well or on which we can count on for the future. if there was proper incentivization for data transmission it could end up being (i), the holy grail of p2p communication over the internet, but that is a very hard problem to solve and not guaranteed to yield the desired scalability results. since not even hints of attempting to solve that are being made, it's safer to conclude it is (ii).

bolt12 limitations
------------------

- not flexible enough. there are some interesting fields defined in the spec, but who gets to add more fields later if necessary? very unclear.
- services can't return any actionable data to the users who paid for something. it's unclear how business can be conducted without an extra communication channel.

bolt12 illusions
----------------

- recurring payments is not really solved, it is just a spec that defines intervals. the actual implementation must still be done by each wallet and service. the recurring payment cannot be enforced, the wallet must still initiate the payment. even if the wallet is evil and is willing to initiate a payment without the user knowing it still needs to have funds, channels, be online, connected etc., so it's not as if the services could rely on the payments being delivered in time.
- people seem to think it will enable pushing payments to mobile wallets, which it does not and cannot.
- there is a confusion of contexts: it looks like offers are superior to lnurl-pay, for example, because they don't require domain names. domain names, though, are common and well-established among internet services and stores, because these services have websites, so this is not really an issue. it is an issue, though, for people that want to receive payments in their homes. for these, indeed, bolt12 offers a superior solution -- but at the same time bolt12 seems to be selling itself as a tool for merchants and service providers when it includes and highlights features as recurring payments and refunds.
- the privacy gains for the receiver that are promoted as being part of bolt12 in fact come from a separate proposal, blinded paths, which should work for all normal lightning payments and indeed are a very nice solution. they are (or at least were, and should be) independent from the bolt12 proposal. a separate proposal, which can be (and already is being) used right now, also improves privacy for the receiver very much anway, it's called trampoline routing.
