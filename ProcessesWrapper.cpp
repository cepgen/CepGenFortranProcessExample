//=============================================================================
// NOLI SE TANGERE
#include "CepGen/Processes/FortranKTProcess.h"
#include "CepGen/Modules/ProcessesFactory.h"
#include "CepGen/Event/Event.h"
//=============================================================================

//=============================================================================
// LIST ALL FORTRAN FUNCTIONS
// usage:
//  DECLARE_FORTRAN_FUNCTION( function_name )
// with the Fortran function name written in lowercase (NO trailing '_')
//=============================================================================

DECLARE_FORTRAN_FUNCTION( dummy_process )

//=============================================================================
// MAP name -> Fortran matrix element evaluation function
// usage:
//  REGISTER_FORTRAN_PROCESS( name, "description", function_name )
//=============================================================================

REGISTER_FORTRAN_PROCESS( dummy, "A dummy Fortran process", dummy_process )
