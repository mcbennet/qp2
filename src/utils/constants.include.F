integer, parameter :: max_dim = 511
integer, parameter :: SIMD_vector = 32
integer, parameter :: N_int_max = 32

double precision, parameter :: pi =  dacos(-1.d0)
double precision, parameter :: inv_pi =  1.d0/dacos(-1.d0)
double precision, parameter :: sqpi =  dsqrt(dacos(-1.d0))
double precision, parameter :: pi_5_2 =  34.9868366552d0
double precision, parameter :: dfour_pi =  4.d0*dacos(-1.d0)
double precision, parameter :: dtwo_pi =  2.d0*dacos(-1.d0)
double precision, parameter :: inv_sq_pi =  1.d0/dsqrt(dacos(-1.d0))
double precision, parameter :: inv_sq_pi_2 = 0.5d0/dsqrt(dacos(-1.d0))
double precision, parameter :: thresh = 1.d-15
double precision, parameter :: cx_lda = -0.73855876638202234d0
double precision, parameter :: c_2_4_3 = 2.5198420997897464d0
double precision, parameter :: cst_lda = -0.93052573634909996d0
double precision, parameter :: c_4_3 = 1.3333333333333333d0
double precision, parameter :: c_1_3 = 0.3333333333333333d0

