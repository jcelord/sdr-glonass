PCBNEW-LibModule-V1  Пн. 23 февр. 2015 14:15:54
# encoding utf-8
Units mm
$INDEX
ContactPad_3x3
FV1206
KX-K_24.0MHz
SAW_3.0x3.0
SMD_0402
SMD_0603
SMD_0805
$EndINDEX
$MODULE ContactPad_3x3
Po 0 0 0 15 54EAC43C 00000000 ~~
Li ContactPad_3x3
Sc 0
AR 
Op 0 0 0
T0 0 3.5 1.524 1.524 0 0.3048 N V 21 N "ContactPad_3x3"
T1 0 -3.2 1.524 1.524 0 0.3048 N V 21 N "VAL**"
$PAD
Sh "1" C 3 3 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 0
$EndPAD
$EndMODULE ContactPad_3x3
$MODULE FV1206
Po 0 0 0 15 54EB0BD3 00000000 ~~
Li FV1206
Sc 0
AR 
Op 0 0 0
T0 0.325 3 1.524 1.524 0 0.3048 N V 21 N "FV1206"
T1 0 -2.725 1.524 1.524 0 0.3048 N V 21 N "VAL**"
DS -0.25 0.1 0.45 0.1 0.05 21
DS -0.45 -0.1 -0.25 0.1 0.05 21
DS -0.45 -0.1 0.45 -0.1 0.05 21
DS 0.45 -0.1 0.45 0.1 0.05 21
$PAD
Sh "2" R 0.8 0.9 0 0 900
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 0.7
$EndPAD
$PAD
Sh "3" R 1.8 0.9 0 0 900
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1.45 0
$EndPAD
$PAD
Sh "1" R 1.8 0.9 0 0 900
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1.45 0
$EndPAD
$PAD
Sh "4" R 0.8 0.9 0 0 900
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 -0.7
$EndPAD
$EndMODULE FV1206
$MODULE KX-K_24.0MHz
Po 0 0 0 15 4B964016 00000000 ~~
Li KX-K_24.0MHz
Cd INDUCTOR
Kw INDUCTOR
Sc 0
AR 
Op 0 0 0
At SMD
T0 0.254 -4.191 1.99898 1.69926 0 0.20066 N V 21 N "KX-K_24.0MHz"
T1 -0.6985 4.572 1.99898 1.50114 0 0.20066 N V 21 N ">VALUE"
DS -6.5405 -2.2225 -6.5405 -1.524 0.381 21
DS -6.5405 2.286 -6.5405 1.524 0.381 21
DS 6.5405 2.286 6.5405 1.524 0.381 21
DS 6.5405 -2.2225 6.5405 -1.524 0.381 21
DS 6.5405 2.286 -6.5405 2.286 0.381 21
DS 6.5405 -2.2225 -6.5405 -2.2225 0.381 21
$PAD
Sh "1" R 5.4991 2.08026 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -4.7498 0
$EndPAD
$PAD
Sh "2" R 5.4991 2.08026 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 4.7498 0
$EndPAD
$EndMODULE KX-K_24.0MHz
$MODULE SAW_3.0x3.0
Po 0 0 0 15 4B961F2A 00000000 ~~
Li SAW_3.0x3.0
Cd SC-70 PACKAGE
Kw SC-70 PACKAGE
Sc 0
AR 
Op 0 0 0
At SMD
T0 1.2065 -1.524 1.016 1.016 0 0.20066 N V 21 N "SAW_3.0x3.0"
T1 1.27 4.2545 1.016 1.016 0 0.20066 N V 21 N ">VALUE"
$PAD
Sh "1" R 1.99898 0.70104 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0.29972 0
$EndPAD
$PAD
Sh "2" R 1.39954 0.59944 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 1.24968
$EndPAD
$PAD
Sh "3" R 1.39954 0.70104 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 2.49936
$EndPAD
$PAD
Sh "4" R 1.39954 0.70104 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2.60096 2.49936
$EndPAD
$PAD
Sh "5" R 1.39954 0.59944 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2.60096 1.24968
$EndPAD
$PAD
Sh "6" R 1.39954 0.70104 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2.60096 0
$EndPAD
$EndMODULE SAW_3.0x3.0
$MODULE SMD_0402
Po 0 0 0 15 4BAB54CB 00000000 ~~
Li SMD_0402
Cd CAPACITOR
Kw CAPACITOR
Sc 0
AR 
Op 0 0 0
At SMD
T0 0.00254 -1.15062 0.508 0.508 0 0.0889 N V 21 N ">NAME"
T1 -0.01016 1.24968 0.508 0.508 0 0.0889 N V 21 N ">VALUE"
DS 1.29794 -0.75184 1.29794 0.75184 0.2032 21
DS 1.29794 0.75184 -1.2954 0.7493 0.2032 21
DS -1.2954 0.7493 -1.29794 -0.7493 0.2032 21
DS -1.29794 -0.7493 1.29794 -0.75184 0.2032 21
$PAD
Sh "1" R 0.6985 0.89916 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -0.6477 0
$EndPAD
$PAD
Sh "2" R 0.6985 0.89916 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0.6477 0
$EndPAD
$EndMODULE SMD_0402
$MODULE SMD_0603
Po 0 0 0 15 4BAB5428 00000000 ~~
Li SMD_0603
Cd CAPACITOR
Kw CAPACITOR
Sc 0
AR 
Op 0 0 0
At SMD
T0 -0.09906 -1.30048 0.508 0.508 0 0.0762 N V 21 N ">NAME"
T1 0.09906 1.39954 0.508 0.508 0 0.0889 N V 21 N ">VALUE"
DS 1.69672 -0.79756 1.69672 0.79756 0.2032 21
DS 1.69672 0.79756 -1.69926 0.79756 0.2032 21
DS -1.69926 0.79756 -1.69926 -0.79756 0.2032 21
DS -1.69926 -0.79756 1.69672 -0.79756 0.2032 21
$PAD
Sh "1" R 1.09982 0.99822 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -0.84836 0
$EndPAD
$PAD
Sh "2" R 1.09982 0.99822 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0.84836 0
$EndPAD
$EndMODULE SMD_0603
$MODULE SMD_0805
Po 0 0 0 15 4BAB5395 00000000 ~~
Li SMD_0805
Cd INDUCTOR
Kw INDUCTOR
Sc 0
AR 
Op 0 0 0
At SMD
T0 0 -1.27 0.508 0.508 0 0.0254 N V 21 N ">NAME"
T1 0 1.27 0.508 0.508 0 0.0254 N V 21 N ">VALUE"
DS 1.89992 -1.05156 1.89992 1.04902 0.2032 21
DS 1.89992 1.04902 -1.89738 1.05156 0.2032 21
DS -1.89738 1.05156 -1.89738 -1.04902 0.2032 21
DS -1.89738 -1.04902 1.89992 -1.05156 0.2032 21
$PAD
Sh "1" R 1.29794 1.4986 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -0.94996 0
$EndPAD
$PAD
Sh "2" R 1.29794 1.4986 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0.94996 0
$EndPAD
$EndMODULE SMD_0805
$EndLIBRARY