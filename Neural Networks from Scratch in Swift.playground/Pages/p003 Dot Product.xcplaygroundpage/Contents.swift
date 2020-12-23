/*
Doing dot product with a layer of neurons and multiple inputs
Associated YT NNFS tutorial: https://www.youtube.com/watch?v=tMrbN67U9d4
*/

let inputs:[Double] = [1.0, 2.0, 3.0, 2.5]
let weights:[[Double]] = [[0.2, 0.8, -0.5, 1.0],
                          [0.5, -0.91, 0.26, -0.5],
                          [-0.26, -0.27, 0.17, 0.87]]

let biases:[Double] = [2.0, 3.0, 0.5]

guard let output:[Double] = weights.dot(inputs)?.add(biases) else {
    fatalError("Unmatched shapes")
}
print(output)
