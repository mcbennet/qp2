program test_dav
  implicit none
  BEGIN_DOC
! TODO : Put the documentation of the program here
  END_DOC
  print *, 'Hello world'
  read_wf = .True.
  touch read_wf
  PROVIDE threshold_davidson nthreads_davidson
  call routine
end

subroutine routine
 implicit none
 double precision, allocatable :: u_in(:,:), H_jj(:), energies(:),h_mat(:,:)
 integer :: dim_in,sze,N_st,N_st_diag_in,dressing_state
 logical :: converged 
 integer :: i,j
 external hcalc_template
 N_st = N_states
 N_st_diag_in = N_states_diag
 sze = N_det
 dim_in = sze
 dressing_state = 0
 !!!! MARK THAT u_in mut dimensioned with "N_st_diag_in" as a second dimension 
 allocate(u_in(dim_in,N_st_diag_in),H_jj(sze),h_mat(sze,sze),energies(N_st))
 u_in = 0.d0
 do i = 1, N_st
  u_in(1,i) = 1.d0
 enddo
 !!! Matrix "h_mat" is the matrix we want to diagonalize with the first routine 
 !!! "davidson_general" 
 do i = 1, sze
  do j = 1, sze
   h_mat(j,i) = H_matrix_all_dets(j,i)
  enddo
  H_jj(i) = H_mat(i,i) + nuclear_repulsion
  h_mat(i,i) = H_mat(i,i) + nuclear_repulsion
 enddo
 provide nthreads_davidson
 call davidson_general(u_in,H_jj,energies,dim_in,sze,N_st,N_st_diag_in,converged,h_mat)
 print*,'energies = ',energies 
 !!! hcalc_template is the routine that computes v = H u 
 !!! and you can use the routine "davidson_general_ext_rout" 
 call davidson_general_ext_rout(u_in,H_jj,energies,dim_in,sze,N_st,N_st_diag_in,converged,hcalc_template)
 print*,'energies = ',energies 
end

