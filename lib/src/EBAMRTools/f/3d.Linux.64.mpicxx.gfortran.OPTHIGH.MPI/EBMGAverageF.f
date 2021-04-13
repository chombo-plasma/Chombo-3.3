        subroutine REGAVERAGE(
     & coarse
     & ,icoarselo0,icoarselo1,icoarselo2
     & ,icoarsehi0,icoarsehi1,icoarsehi2
     & ,fine
     & ,ifinelo0,ifinelo1,ifinelo2
     & ,ifinehi0,ifinehi1,ifinehi2
     & ,icoarboxlo0,icoarboxlo1,icoarboxlo2
     & ,icoarboxhi0,icoarboxhi1,icoarboxhi2
     & ,irefboxlo0,irefboxlo1,irefboxlo2
     & ,irefboxhi0,irefboxhi1,irefboxhi2
     & ,numfinepercoar
     & ,reftocoar
     & )
      implicit none
      integer*8 ch_flops
      COMMON/ch_timer/ ch_flops
      integer icoarselo0,icoarselo1,icoarselo2
      integer icoarsehi0,icoarsehi1,icoarsehi2
      REAL*8 coarse(
     & icoarselo0:icoarsehi0,
     & icoarselo1:icoarsehi1,
     & icoarselo2:icoarsehi2)
      integer ifinelo0,ifinelo1,ifinelo2
      integer ifinehi0,ifinehi1,ifinehi2
      REAL*8 fine(
     & ifinelo0:ifinehi0,
     & ifinelo1:ifinehi1,
     & ifinelo2:ifinehi2)
      integer icoarboxlo0,icoarboxlo1,icoarboxlo2
      integer icoarboxhi0,icoarboxhi1,icoarboxhi2
      integer irefboxlo0,irefboxlo1,irefboxlo2
      integer irefboxhi0,irefboxhi1,irefboxhi2
      integer numfinepercoar
      integer reftocoar
        integer iic,jjc,kkc
        integer iie,jje,kke
        integer iif,jjf,kkf
        REAL*8 weight
        weight = (1.0d0) / numfinepercoar
      do kkc = icoarboxlo2,icoarboxhi2
      do jjc = icoarboxlo1,icoarboxhi1
      do iic = icoarboxlo0,icoarboxhi0
      do kke = irefboxlo2,irefboxhi2
      do jje = irefboxlo1,irefboxhi1
      do iie = irefboxlo0,irefboxhi0
        iif = reftocoar*iic + iie
        jjf = reftocoar*jjc + jje
        kkf = reftocoar*kkc + kke
        coarse(iic,jjc,kkc) = coarse(iic,jjc,kkc)
     & + weight*fine(iif,jjf,kkf)
      enddo
      enddo
      enddo
      enddo
      enddo
      enddo
        ch_flops=ch_flops+(icoarboxhi0- icoarboxlo0+1)*(icoarboxhi1- ico
     &arboxlo1+1)*(icoarboxhi2- icoarboxlo2+1)*(irefboxhi0- irefboxlo0+1
     &)*(irefboxhi1- irefboxlo1+1)*(irefboxhi2- irefboxlo2+1)*(2+3)
        return
        end