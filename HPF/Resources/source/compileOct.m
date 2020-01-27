if isfile('oct_test_fft.oct') == 1
        delete oct_test_fft.oct
end 
mkoctfile oct_test_fft.cpp func_FFT.c  fft_utils.c '-I ./' '--verbose' 

% delete object files
%delete *.o