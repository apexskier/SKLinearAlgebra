# SKLinearAlgebra

Linear Algebra extensions for SceneKit

This library allows common vector operations using SceneKit's native
`SCNVector3`, `SCNVector4`, and `SCNMatrix4` types. It also provides
useful linear algebra functions for 3D graphics.

## Implemented

Tests are complete for all implemented features.

### Operations

- equality (`==`)
- inequality (`!=`)
- equivalence (`≈`)
  - returns true if the components of two vectos are close to equal to each other.
- inequivalence (`!≈`)
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
- component (`component(a, b)`) - comp_{b} a
  - Read this as "the component of a onto b", it would be written comp_{b} a.
- projection (`projection(a, b)`)
  - Read this as "the projection of a onto b", it would be written proj_{b} a

## Future Ideas

- Some kind of support for bases (origin + 3 vectors)
  - Conversion between basis
- Use specific type aliases
  - Vectors for colors, locations, directions, rotations
- Rotation utilities
- Torque and Force utilities