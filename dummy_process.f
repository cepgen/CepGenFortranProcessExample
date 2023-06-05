      function dummy_process()
      implicit none
      double precision dummy_process
      !--------------------------------------------------------------------------
      ! CepGen overhead
      !--------------------------------------------------------------------------
      include 'CepGen/Process/Fortran/KTBlocks.inc' ! mandatory, include the kinematics common blocks
      call CepGen_print      ! optional, display some run parameters information
      !--------------------------------------------------------------------------
      ! end of overhead, beginning of process definition
      !--------------------------------------------------------------------------
      dummy_process = 1.D0 ! placeholder, your actual definition is to be
                               ! implemented here
      !--------------------------------------------------------------------------
      ! end of process definition
      !--------------------------------------------------------------------------
      return
      end
