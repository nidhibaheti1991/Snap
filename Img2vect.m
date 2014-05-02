function image=Img2vect(img_name)
    I=imread(img_name);
    save I;
    load I;
    B=imresize(I,[28,28]);
    %imshow(B)
    b=im2bw(B);
    %imshow(b)
    Colvec=b(:);
    image=Colvec;
    %csvwrite(file_name,Colvec,0,0);

    %A=csvread(file_name);
    %newA=[A Colvec];  

    %csvwrite(file_name,newA);
end
