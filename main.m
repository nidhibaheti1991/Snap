function  main(clusterno ,X, trainParams)
        cluster_numbers=clusterno;
        net=createARTnetwork(cluster_numbers);
        save('originalnet.mat','net')
        result=trainARTnetwork(clusterno,net,X, trainParams );
        save('trainednet.mat','result')
        O=result(X);
        clusters_formed=result.layers{2}.size;
        [m,I]=max(O);
        [error,classifier]=train_classification(clusters_formed,I);
        save('classificationnet.mat','classifier')
        message=['Error is',num2str(error)];
        disp(message)
        view(result)
end