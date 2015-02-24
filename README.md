# SKLinearAlgebra

Linear Algebra extensions for SceneKit

This library allows common vector operations using SceneKit's
[native types](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes/): 
`SCNVector3`, `SCNVector4`, and `SCNMatrix4`. It also provides useful
linear algebra functions for 3D graphics.

It has been written in the style of Swift, intending to enhance and complete 
Scenekit's existing
[functions](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SceneKit_Functions/).

## Implemented

Tests are complete for all implemented features.

### Operations

- equality (`==`)
- inequality (`!=`)
- equivalence (`≈`)
  - returns true if the components of two vectos are close to equal to each 
    other.
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