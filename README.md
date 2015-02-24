# SKLinearAlgebra

Linear Algebra extensions for SceneKit

This library allows common vector operations using SceneKit's native
`SCNVector3`, `SCNVector4`, and `SCNMatrix4` types. It also provides
useful linear algebra functions for 3D graphics.

## Implemented

Tests are complete for all implemented features.

### Operations

- vector addition (`+`)
- vector subtraction (`-`)
- dot product (`*`)
- scalar multiplication (`*`)
- scalar division (`\`)
- cross product (`×`)

### Functions

- cross product (`cross(a, b)`)
- magnitude (`magnitude(v)`)
- normalize (`normalize(v)`)
- degrees between (`degrees(a, b)`)

## TODO

- component
- projection

## Future Ideas

- Some kind of support for bases (origin + 3 vectors)
  - Conversion between basis
- Use specific type aliases
  - Vectors for colors, locations, directions, rotations
- Rotation utilities
- Torque and Force utilities