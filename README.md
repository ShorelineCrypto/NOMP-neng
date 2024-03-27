
# NOMP-neng - A Solo Pool for Nengcoin
#### Node Open Mining Portal
#### Decentralization, Own your NENG Full Node at home!
#### Achieve Personal Financial Soveignty with Nengcoin by Mining at Home!
#### Suitable for CPU, GPU, USB ASIC, ASIC for all Rig Miners!

This pool is adapted from Garlicoin NOMP dockerhub image and its source code. Its default configuration is tailored to home based scrypt Nengcoin solo miners
that have weak hash rate power that mainly focuses on mining at low to mid difficulty ranges.

Nengcoin solo pool running in many different homes of Nengcoin miners will increase decentralization and resiliance of Nengcoin network.

In general, solo private pool mining for Nengcoin is recommended and should be more profitable for average joe's scrypt USB ASIC devices
that lack the hash power compared to big litecoin/doge big rigs at public pools. 

## Installation

Please follow step by step installation guide in INSTALL.md file for setup the solo pool. The default example file variable diff is optimized for Futurebit
Moonlander2 USB ASIC (hashrate 3 MH/s).

## Other Devices Optimization

The default variable diff range also should work well for other weak devices such as Gridseed 5 chip USB miner, GPU or even high end powerful PC CPUs on cpu mining
software that support scrypt.  If your scrypt ASIC rig is much stronger on hashrate, change the settings on file "nengcoin.json" in pool configuration folder
to optimize your own device settings easily following "INSTALL.md" step by step guide.


License
-------
Released under the GNU General Public License v2

http://www.gnu.org/licenses/gpl-2.0.html
