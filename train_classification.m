function [error,classifier]= train_classification(clusters_formed,I)
    F2=clusters_formed;
    Ivec=full(ind2vec(I,F2));
    target=csvread('C:\Users\User\Documents\MATLAB\M&N\art database\target_small.csv',0,0);
    classifier=patternnet(20);
    classifier.divideParam.valRatio=0;
    classifier.divideParam.testRatio=0;
    classifier.divideParam.trainRatio=1;
    Tvec=full(ind2vec(target));
    classifier=train(classifier,Ivec,Tvec);
    Yvec=classifier(Ivec);
    Y=vec2ind(Yvec);
    error=sum(Y~=target);
end