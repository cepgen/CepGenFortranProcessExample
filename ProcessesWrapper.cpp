//=============================================================================
// NOLI SE TANGERE
#include "CepGen/Event/Event.h"
#include "CepGen/Modules/ProcessFactory.h"
#include "CepGen/Process/FortranFactorisedProcess.h"
//=============================================================================

//=============================================================================
// LIST ALL FORTRAN FUNCTIONS
// usage:
//  DECLARE_FORTRAN_FUNCTION( function_name );
// with the Fortran function name written in lowercase (NO trailing '_')
//=============================================================================

DECLARE_FORTRAN_FUNCTION(dummy_process);

//=============================================================================
// MAP name -> Fortran matrix element evaluation function
// usage:
//  REGISTER_FORTRAN_PROCESS( name, "description", function_name );
//=============================================================================

REGISTER_FORTRAN_PROCESS(dummy, "A dummy Fortran process", dummy_process);
