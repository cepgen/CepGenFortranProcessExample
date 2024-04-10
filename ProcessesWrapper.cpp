//=============================================================================
// NOLI SE TANGERE
#include "CepGen/Event/Event.h"
#include "CepGen/Modules/ProcessFactory.h"
#include "CepGen/Process/FortranFactorisedProcess.h"
//=============================================================================

//=============================================================================
// MAP name -> Fortran matrix element evaluation function
// usage:
//  REGISTER_FORTRAN_PROCESS(name, "description", function_name);
// with the Fortran function name written in lowercase (NO trailing '_')
//=============================================================================

REGISTER_FORTRAN_PROCESS(dummy, "A dummy Fortran process", dummy_process);
