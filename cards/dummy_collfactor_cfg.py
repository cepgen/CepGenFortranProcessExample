import Config.Core as cepgen
import Config.collinearProcess_cfi as coll

process = coll.process.clone('dummy',
    processParameters = cepgen.Parameters(
    ),
    inKinematics = cepgen.Parameters(
        sqrtS = 13.e3,
        partonFluxes = (coll.ProtonFlux.PhotonElastic, coll.ProtonFlux.PhotonInelastic),
    )
)
