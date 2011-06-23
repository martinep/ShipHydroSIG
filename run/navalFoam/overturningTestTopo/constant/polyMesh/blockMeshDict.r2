/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  1.4                                   |
|   \\  /    A nd           | Web:      http://www.openfoam.org               |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

FoamFile
{
    version         2.0;
    format          ascii;
    class           dictionary;
    object          blockMeshDict;
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //


convertToMeters 0.1;

vertices
(
    // Back plane
    (-7 -4 -0.1)
    ( 7 -4 -0.1)

    (-1.414213 -1.414213 -0.1)
    ( 1.414213 -1.414213 -0.1)

    (-1.732051 -1 -0.1)
    ( 1.732051 -1 -0.1)

    (-1 -0.3 -0.1)
    ( 1 -0.3 -0.1)

    (-1  0.3 -0.1)
    ( 1  0.3 -0.1)

    (-1.732051  1 -0.1)
    ( 1.732051  1 -0.1)

    (-1.414213  1.414213 -0.1)
    ( 1.414213  1.414213 -0.1)

    (-7  4 -0.1)
    ( 7  4 -0.1)

    // Front plane
    (-7 -4  0.1)
    ( 7 -4  0.1)

    (-1.414213 -1.414213  0.1)
    ( 1.414213 -1.414213  0.1)

    (-1.732051 -1  0.1)
    ( 1.732051 -1  0.1)

    (-1 -0.3  0.1)
    ( 1 -0.3  0.1)

    (-1  0.3  0.1)
    ( 1  0.3  0.1)

    (-1.732051  1  0.1)
    ( 1.732051  1  0.1)

    (-1.414213  1.414213  0.1)
    ( 1.414213  1.414213  0.1)

    (-7  4  0.1)
    ( 7  4  0.1)
);

blocks
(
    // Stator
    hex (0 1 3 2 16 17 19 18) (20 20 1) simpleGrading (1 0.5 1)
    hex (1 15 13 3 17 31 29 19) (20 20 1) simpleGrading (1 0.5 1)
    hex (15 14 12 13 31 30 28 29) (20 20 1) simpleGrading (1 0.5 1)
    hex (14 0 2 12 30 16 18 28) (20 20 1) simpleGrading (1 0.5 1)

    // Barge, rotor
    hex (4 5 7 6 20 21 23 22) (30 15 1) simpleGrading (1 0.25 1)
    hex (5 11 9 7 21 27 25 23) (25 15 1) simpleGrading (1 0.25 1)
    hex (11 10 8 9 27 26 24 25) (30 15 1) simpleGrading (1 0.25 1)
    hex (10 4 6 8 26 20 22 24) (25 15 1) simpleGrading (1 0.25 1)
);

edges
(
    // Back plane
    arc  2  3  (0 -2 -0.1)
    arc  3 13  (2 0 -0.1)

    arc 13 12  (0 2 -0.1)
    arc 12  2  (-2 0 -0.1)

    arc  4  5  (0 -2 -0.1)
    arc  5 11  (2 0 -0.1)

    arc 11 10  (0 2 -0.1)
    arc 10  4  (-2 0 -0.1)

    // Front plane
     arc 18 19  (0 -2  0.1)
     arc 19 29  (2 0  0.1)

     arc 29 28  (0 2  0.1)
     arc 28 18  (-2 0  0.1)

     arc 20 21  (0 -2  0.1)
     arc 21 27  (2 0  0.1)

     arc 27 26  (0 2  0.1)
     arc 26 20  (-2 0  0.1)
);

patches
(
    wall barge
    (
        (6 22 23 7)
        (7 23 25 9)
        (9 25 24 8)
        (8 24 22 6)
    )

    patch bargeSlider
    (
        (4 5 21 20)
        (5 11 27 21)
        (11 10 26 27)
        (10 4 20 26)
    )

    patch boxSlider
    (
        (2 18 19 3)
        (3 19 29 13)
        (13 29 28 12)
        (12 28 18 2)
    )

    patch left
    (
        (0 16 30 14)
    )

    patch right
    (
        (1 15 31 17)
    )

    patch bottom
    (
        (0 1 17 16)
    )

    patch top
    (
        (15 14 30 31)
    )

    empty frontAndBack
    (
        // Back, out
        (0 2 3 1)
        (1 3 13 15)
        (15 13 12 14)
        (14 12 2 0)

        // Back, in
        (4 5 7 6)
        (5 7 9 11)
        (11 9 8 10)
        (10 8 6 4)

        // Front, out
        (16 17 19 18)
        (17 31 29 19)
        (31 30 28 29)
        (30 16 18 28)

        // Front, in
        (20 21 23 22)
        (21 27 25 23)
        (27 26 24 25)
        (26 20 22 24)
    )
);

mergePatchPairs
();


// ************************************************************************* //
