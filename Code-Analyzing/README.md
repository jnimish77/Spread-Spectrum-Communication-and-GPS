Run programs from Chapter 3 (Harada’s book) simulating BPSK, QPSK, OQPSK. Matlab
programs are available in Chapter3.zip file. (simulations with files without fading)
Your final plots should be similar to Fig. 3.8 of Harada’s (HW) book or “bell” figure on “error
probability” section of lecture notes on “Intro to Communications”.
- These programs define bit probability Pb for one value of Eb/N0. Please update the code
(adding one more loop) so you can get the curves of Pb versus Eb/N0. This is the only required
change in the software. But you can play with the software changing parameters.
- Get the figure plots using Matlab and enter notation for axes similar to the book.
(Remark:
have plots in a suitable format -- you can use the Figure Window or the command line instruction,
e.g.:
>>print –deps –tiff yourfile.eps % (creates file in .eps format with tiff preview. In MS Word select
Insert Picture from file and add the figure)
)
1. Probability curves for BPSK, QPSK, OQPSK (add one additional loop on Eb/N0 to get curves)
2. Compute the spectra of oversampled signal by computing FFT of the signal fragment. Use fft.m
Matlab function. (Only for BPSK)
3. Compute the spectra of the signal after noise added and after the receive filter. (Only for
BPSK)
4. Plot transmit (pulse-shaping) and receive (matched) filter shapes
5. Plot signal fragments after oversampling and after transmit (pulse-shaping) filter to see the
process of transforming bits into waveforms.
6. Plot fragments of the signals before and after receive (matched) filter to see the effect of
denoising. (Only BPSK)
- prepare a short report on simulated modulations
- Submit your HW; also a copy through Blackboard in electronic form.
- let me know if you have any questions
