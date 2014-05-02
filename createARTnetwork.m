function [ result ] = createARTnetwork(cluster_numbers)
    F2=cluster_numbers;
    result = network;
    result.name = 'ART1';
    result.numInputs = 1;
    result.numLayers = 2;
    
    result.inputConnect = [1; 0];
    result.layerConnect = [0 1; 1 0];
    result.outputConnect = [0 1];
    
    result.inputs{1}.name = 'F1(a)';
    result.inputs{1}.size = 784;
    
    result.layers{1}.name = 'F1(b)';
    result.layers{1}.size = 784;
    
    result.layers{2}.name = 'F2';
    result.layers{2}.size = F2;
    
    result.layerWeights{1, 2}.delays = 1;
    
    result.IW{1, 1} = diag(ones(1, 784));
end