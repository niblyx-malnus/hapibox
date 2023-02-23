# hapibox

a simple skeleton and sandbox to start messing around with the urbit [http-api](https://github.com/urbit/urbit/tree/master/pkg/npm/http-api) library (especially if you're a Hooner with no frontend experience (like me!))

- All examples are drawn from [here](https://developers.urbit.org/guides/additional/http-api-guide).
- See [other skeletons](https://github.com/niblyx-malnus/desk-skeletons).
- Look [here](https://reactjs.org/docs/add-react-to-a-website.html) to explore gradually incorporating React elements into what you've built.

Files to mess around with:

- `/app/hapibox.hoon`
- `/app/ex/auth.html`
- `/app/ex/poke.html`
- `/app/ex/scry.html`
- `/app/ex/sub1.html`
- `/app/ex/sub-unsub.html`
- `/app/ex/ted.html`

## Installation
1. Clone this repo.
2. Boot up a ship (fakezod or moon or whatever you use).
4. `|new-desk %hapibox` to create a new desk called `%hapibox.
5. `|mount %hapibox` to access the `%hapibox` desk from the unix command line.
6. At the unix command line `rm -rf [ship-name]/hapibox/*` to empty out the contents of the desk.
7. `cp -r hapibox/* [ship-name]/hapibox` to copy the contents of this repo into your new desk.
8. At the dojo command line `|commit %hapibox`.
9. Install with `|install our %hapibox`.
10. Go to one of the following urls to see the examples. Mess around with the code in `/app/ex` to change the behavior of these pages.
  - `[your-domain-name]/apps/hapibox/auth`
  - `[your-domain-name]/apps/hapibox/poke`
  - `[your-domain-name]/apps/hapibox/scry`
  - `[your-domain-name]/apps/hapibox/sub1`
  - `[your-domain-name]/apps/hapibox/sub-unsub`
  - `[your-domain-name]/apps/hapibox/ted`
