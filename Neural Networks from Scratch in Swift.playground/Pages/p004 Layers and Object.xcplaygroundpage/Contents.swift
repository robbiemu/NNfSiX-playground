/*
Associated YT tutorial: https://youtu.be/TEWy9vZcxW4
*/
import GameKit

let rs = GKLinearCongruentialRandomSource()
rs.seed = 0
let rd = GKGaussianDistribution(randomSource: rs, mean: 0, deviation: Float(UInt8.max))

let X = [[1.0, 2.0, 3.0, 2.5],
              [2.0, 5.0, -1.0, 2.0],
              [-1.5, 2.7, 3.3, -0.8]]

class LayerDense {
    public var output: [[Double]]
    public var weights: [[Double]]
    public var biases: [Double]
    
    init(n_inputs: Int, n_neurons: Int) {
        weights = (0..<n_inputs).map { _ in
            (0..<n_neurons).map { _ in Double(rd.nextUniform()) * 0.1 }
        }
        biases = Array(repeating: 0.0, count: n_neurons)
        output = Array(repeating: [], count: n_neurons)
    }
    
    func forward(inputs: [[Double]]) {
        output = inputs.dot(weights)!.add(biases)!
    }
}

let layer1 = LayerDense(n_inputs: 4, n_neurons: 5)
let layer2 = LayerDense(n_inputs: 5, n_neurons: 2)

layer1.forward(inputs: X)
layer2.forward(inputs: layer1.output)
print(layer2.output)
