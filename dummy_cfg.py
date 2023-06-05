import Config.Core as cepgen

process = cepgen.Module('dummy',
    processParameters = cepgen.Parameters(
    ),
    inKinematics = cepgen.Parameters(
        sqrtS = 13.e3,
    )
)
