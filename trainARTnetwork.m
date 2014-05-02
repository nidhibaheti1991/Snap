function [ result ] = trainARTnetwork(clusterno,net,X, trainParams )
    result = net;
    [R,C]=size(X);
    F1=R;
    F2 =clusterno;
    L = trainParams.L;
    if ~L
        L = randi(trainParams.max_L);
    end
    vigilanceParam = trainParams.vigilance;
    if ~vigilanceParam
        vigilanceParam=rand();
    end
    bottomUp = repmat(0.2,2000,F1);
    topDown = ones(F1,2000);
    
    for iter = 1:trainParams.epochs
        disp(iter);
        XNorm = sum(X);
        weightUpdated = false;
        for i = 1:C
            x = X(:, i);
            for j = 1:F2
                y(j,:) = bottomUp(j,:) * x;
            end
                activation=zeros(F2,1);
                 while true
                        [v, J] = max(y);
                        if activation(J,1) == -1
                                string=['Pattern',num2str(i),'cannot be clustered'];
                                disp(string)
                                F2=F2+1;
                                t=topDown(:,F2);
                                f1_outt=(topDown(:, F2) .* x);
                                bottomUp(F2, :) = (L/(L - 1 + sNorm)) * f1_outt';
                                topDown(:, F2) = f1_outt;
                                break;
                        end
                        f1_out=(topDown(:, J) .* x);
                        sNorm = sum(f1_out);
                        if sNorm / XNorm(i) < vigilanceParam
                            activation(J,1)=-1;
                        else
                            activation(J,1)=1;
                            bottomUp(J, :) = (L/(L - 1 + sNorm)) * f1_out';
                            topDown(:, J) = f1_out;
                            weightUpdated = true;
                            break;
                        end
                 end
        
           if ~weightUpdated
               break;
           end
        end
    end
    result.layers{2}.size = F2;
    bottomUpFinal=zeros(F2,784);
    topDownFinal=zeros(784,F2);
    for j=1:F2
        bottomUpFinal(j,:)=bottomUp(j,:);
        topDownFinal(:,j)=topDown(:,j);
    end
    result.LW{2, 1} = bottomUpFinal;
    result.LW{1, 2} = topDownFinal;
end