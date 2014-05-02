function user(img_name)
    image=Img2vect(img_name);
     output=result(image);
     [m,I]=max(output);
     F2=result.layers{2}.size;
     Ivec=full(ind2vec(I,F2));
     Yvec=classifier(Ivec);
     Y=vec2ind(Yvec);
     disp(Y)
end