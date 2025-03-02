
subroutine give_all_mos_at_r(r,mos_array)
 implicit none
 double precision, intent(in) :: r(3)
 double precision, intent(out) :: mos_array(mo_num)
 double precision :: aos_array(ao_num)
 call give_all_aos_at_r(r,aos_array)
 call dgemv('N',mo_num,ao_num,1.d0,mo_coef_transp,mo_num,aos_array,1,0.d0,mos_array,1)
end

subroutine give_all_mos_and_grad_at_r(r,mos_array,mos_grad_array)
 implicit none
 double precision, intent(in) :: r(3)
 double precision, intent(out) :: mos_array(mo_num)
 double precision, intent(out) :: mos_grad_array(3,mo_num)
 integer :: i,j,k
 double precision :: aos_array(ao_num),aos_grad_array(3,ao_num)
 call give_all_aos_and_grad_at_r(r,aos_array,aos_grad_array)
 mos_array=0d0
 mos_grad_array=0d0
 do j = 1, mo_num
  do k=1, ao_num
   mos_array(j) += mo_coef(k,j)*aos_array(k)
   mos_grad_array(1,j) += mo_coef(k,j)*aos_grad_array(1,k)
   mos_grad_array(2,j) += mo_coef(k,j)*aos_grad_array(2,k)
   mos_grad_array(3,j) += mo_coef(k,j)*aos_grad_array(3,k)
  enddo
 enddo
end


subroutine give_all_mos_and_grad_and_lapl_at_r(r,mos_array,mos_grad_array,mos_lapl_array)
 implicit none
 double precision, intent(in) :: r(3)
 double precision, intent(out) :: mos_array(mo_num)
 double precision, intent(out) :: mos_grad_array(3,mo_num),mos_lapl_array(3,mo_num)
 integer :: i,j,k
 double precision :: aos_array(ao_num),aos_grad_array(3,ao_num),aos_lapl_array(3,ao_num)
 call give_all_aos_and_grad_and_lapl_at_r(r,aos_array,aos_grad_array,aos_lapl_array)
 mos_array      = 0.d0
 mos_grad_array = 0.d0
 mos_lapl_array = 0.d0
 do j = 1, mo_num
  do k=1, ao_num
   mos_array(j)        += mo_coef(k,j) * aos_array(k)
   mos_grad_array(1,j) += mo_coef(k,j) * aos_grad_array(1,k)
   mos_grad_array(2,j) += mo_coef(k,j) * aos_grad_array(2,k)
   mos_grad_array(3,j) += mo_coef(k,j) * aos_grad_array(3,k)
   mos_lapl_array(1,j) += mo_coef(k,j) * aos_lapl_array(1,k)
   mos_lapl_array(2,j) += mo_coef(k,j) * aos_lapl_array(2,k)
   mos_lapl_array(3,j) += mo_coef(k,j) * aos_lapl_array(3,k)
  enddo
 enddo
end

