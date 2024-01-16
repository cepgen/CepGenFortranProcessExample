import Config.Core as cepgen
import Config.ktProcess_cfi as kt

process = kt.process.clone('dummy',
    processParameters = cepgen.Parameters(
    ),
    inKinematics = cepgen.Parameters(
        sqrtS = 13.e3,
        partonFluxes = (kt.ProtonFlux.PhotonElasticBudnev, kt.ProtonFlux.PhotonElasticBudnev),
    )
)
