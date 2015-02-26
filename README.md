# SKLinearAlgebra

This library allows common vector operations using SceneKit's
[native types](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes/): 
`SCNVector3`, `SCNVector4`, and `SCNMatrix4`. It also provides useful
linear algebra functions for 3D graphics.

It has been written in the style of Swift, intending to enhance and complete 
Scenekit's existing
[functions](https://developer.apple.com/library/mac/documentation/SceneKit/Reference/SceneKit_Functions/).

## Features

Tests are complete for all implemented features.

### Operations

- equality (`==`)
- inequality (`!=`)
- equivalence (`~=`)
  - Returns true if the components are close to equal to each other.
- inequivalence (`!~=`)
- addition (`+`, `+=`)
- subtraction (`-`, `-=`)
- dot product (`*`)
- scalar multiplication (`*`, `*=`)
- scalar division (`/`, `/=`)
- cross product (`×`)
- subscript access (`v[0]`, `m[1, 2]`)
  - Zero based indexing
  - Access by [row, column]

### Functions

- cross product (`cross(a: Vector, b: Vector)`)
- magnitude (`magnitude(v: Vector)`)
- normalize (`normalize(v: Vector)`)
- degrees between (`degrees(a: Vector, b: Vector)`)
- component (`component(a: Vector, b: Vector)`) - comp_{b} a
  - Read this as "the component of a onto b", it would be written comp_{b} a.
- projection (`projection(a: Vector, b: Vector)`)
  - Read this as "the projection of a onto b", it would be written proj_{b} a
- determinate (`det(m: Matrix)`)
- transpose (`transpose(m: Matrix)`)
- inverse (`inverse(m: Matrix)`)

## Future Plans

- Some kind of support for bases (origin + 3 vectors)
  - Conversion between basis
- Use specific type aliases
  - Vectors for colors, locations, directions, rotations
- Rotation utilities
- Torque and Force utilities
- Utilize [Accelerate](https://developer.apple.com/library/mac/documentation/Accelerate/Reference/AccelerateFWRef/) or [Surge](https://github.com/mattt/Surge)




You should follow [me on Twitter](https://twitter.com/apexskier).
