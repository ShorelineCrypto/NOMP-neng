
# NOMP-neng - A Solo Pool for Nengcoin and Cheetahcoin
#### Node Open Mining Portal
#### Decentralization, Own your Nengcoin and Cheetahcoin Full Node at home!
#### Suitable for CPU, GPU, USB ASIC, ASIC for all Rig Miners!

This pool is adapted from Garlicoin NOMP dockerhub image and its source code. Its default configuration is tailored to home based Nengcoin (scrypt) and Cheetahcoin (sha256) solo miners
with USB ASIC devices on weak hash rate power focusing mainly on mining at low to mid difficulty ranges.

Miners on nengcoin solo pool and/or cheetahcoin solo pool running in many different geological locations will increase decentralization and resilience of nengcoin and cheetahcoin network.

In general, solo private pool mining for nengcoin is recommended and should be more profitable for average joe's scrypt ASIC devices
that lack the hash power compared to litecoin/doge big rigs at public pools. Similarly, solo private pool mining for Cheetahcoin is recommended and should be more profitable for average joe's sha256 ASIC devices
that lack the hash power compared to bitcoin big rigs at public pools when direct solo mining mode toward locally running full node is not available. 

## Installation

Please follow step by step installation guide in INSTALL.md file for setup the solo pool. The default example file variable diff is optimized for Futurebit
Moonlander2 USB ASIC (hashrate 3 MH/s) for nengcoin scrypt mining and for gekko newpac USB ASIC (hashrate 90 GH/s) for cheetahcoin sha256 mining.

## Other Devices Optimization

The default variable diff range also should work well for other weak devices such as Gridseed 5 chip USB miner, Avalon Nano 3, GPU or even high end powerful PC CPUs on cpu mining
software that support scrypt or sha256.  If your scrypt/sha256 ASIC rig is much stronger on hashrate, change the settings on file "nengcoin.json" or "cheetahcoin.json" in pool configuration folder
to optimize your own device settings easily following "INSTALL.md" step by step guide.


License
-------
Released under the GNU General Public License v2

http://www.gnu.org/licenses/gpl-2.0.html
