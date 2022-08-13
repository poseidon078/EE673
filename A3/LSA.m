A=[0 1 3 7;
    1 0 1 999;
    3 1 0 2;
    7 999 2 0];
N=A~=0 & A~=999;

for node=1:4
    %for node 1
    H=[1 2 3 4];
    X=[node]; %N' matrix as mentioned in algo
    D=A(node,:);
    D0=D;
    D0(node)=1000; %1000 denotes that this node is used already for making X
    while size(X,1)<4  %no. of nodes=4
        [Ma, I]=min(D0);
        M=D(I);
        if ismember(I,X)==false
            X=[X; I];
            for r=1:4
                if ismember(r, X)==false && N(I, r)==true
                    if M+A(I,r)< D(r)
                        H(r)=H(I); %use same hop for r as the hop to I
                    
                    end
                    D(r)=min(M+A(I,r), D(r));
                    D0(r)=D(r);
                end
            end
        else
            D0(I)=1000;
        end
    end
    D
    H
    X=[];
    D=[];
    D0=[];
end

%each printed row is the cost (D) and next hop (H) for each node from 1 to 4


    


