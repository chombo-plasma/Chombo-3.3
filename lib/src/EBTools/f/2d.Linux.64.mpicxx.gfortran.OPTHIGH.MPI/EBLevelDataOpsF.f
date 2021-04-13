      subroutine EBAVECELLTOFACE(
     & facedata
     & ,ifacedatalo0,ifacedatalo1
     & ,ifacedatahi0,ifacedatahi1
     & ,celldata
     & ,icelldatalo0,icelldatalo1
     & ,icelldatahi0,icelldatahi1
     & ,facedir
     & ,ifaceboxlo0,ifaceboxlo1
     & ,ifaceboxhi0,ifaceboxhi1
     & )
      implicit none
      integer*8 ch_flops
      COMMON/ch_timer/ ch_flops
      integer CHF_ID(0:5,0:5)
      data CHF_ID/ 1,0,0,0,0,0 ,0,1,0,0,0,0 ,0,0,1,0,0,0 ,0,0,0,1,0,0 ,0
     &,0,0,0,1,0 ,0,0,0,0,0,1 /
      integer ifacedatalo0,ifacedatalo1
      integer ifacedatahi0,ifacedatahi1
      REAL*8 facedata(
     & ifacedatalo0:ifacedatahi0,
     & ifacedatalo1:ifacedatahi1)
      integer icelldatalo0,icelldatalo1
      integer icelldatahi0,icelldatahi1
      REAL*8 celldata(
     & icelldatalo0:icelldatahi0,
     & icelldatalo1:icelldatahi1)
      integer facedir
      integer ifaceboxlo0,ifaceboxlo1
      integer ifaceboxhi0,ifaceboxhi1
      integer i,j
      integer ioff,joff
      ioff = chf_id(0,facedir)
      joff = chf_id(1,facedir)
      do j = ifaceboxlo1,ifaceboxhi1
      do i = ifaceboxlo0,ifaceboxhi0
      facedata(i,j) =
     & ( celldata(i ,j )
     & + celldata(i-ioff,j-joff)
     & )*(0.500d0)
      enddo
      enddo
      ch_flops=ch_flops+(ifaceboxhi0- ifaceboxlo0+1)*(ifaceboxhi1- iface
     &boxlo1+1)*2
      return
      end