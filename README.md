# M4-Aim-Dash

Pro-bono project made for crash's personal M4 mod.

Some features:
- Custom RPM Gauge
- Several engine temps
- Lap metrics

https://github.com/plus-and-other-arithmetic-operations/M4-Aim-Dash/assets/88043761/09d3f806-697d-4545-b2fa-64ce9467a193

## Setup

```ini
[SCRIPTABLE_DISPLAY_...]
ACTIVE = $" read('csp/version', 0) >= 1709 "
MESHES = INT_GAUGE_AIM
RESOLUTION = 963, 474
DISPLAY_POS = 0,0
DISPLAY_SIZE = 963, 474
SKIP_FRAMES = 0
SCRIPT = 'aimdash.lua'
```
