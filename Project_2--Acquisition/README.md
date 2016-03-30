
Signal generator from previous design project is used in this
project. We acquire a signal with shifted code phase and
Doppler sinusoidal modulation as generated in Design Project
I. Set a code phase to 556, Doppler frequency to 1kHz. Add
AWGN noise as your generator can do it.
• Have two “for” loops: (1) Loop 1: multiply received signal to
complex sinusoids exp(−2π jfnts ) to wipe-off Doppler
modulation, select sinusoids [-2kHz -1.5kHz, -1kHz, 0kHz,
1kHz, 1.5 kHz, 2kHz] as candidate sinusoids; (2) Loop 2. For
each candidate frequency apply code correlator as explained
below. You will get 3D picture, e.g. all code phases on x-axis,
all frequencies on y-axis, and correlation values on z-axis. Set
noise to “0”, get a perfect peak, increase noise to have noise
floor increased. Plot the picture and report.
• Use two correlator design approaches (1) parallel set of
ordinary correlators. (2) matched filter. For matched filter
conv.m routine can be used.
• Assume certain number of coherent and noncoherent stages
(take 2 and 2). Calculate correlation value and combine
coherently and noncoherently several periods of
autocorrelation.
