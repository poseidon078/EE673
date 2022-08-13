A=[0 1 3 7;
    1 0 1 999;
    3 1 0 2;
    7 999 2 0];
N=A~=0 & A~=999;
global X
X=[];

D0 = rinit0();
D1 = rinit1();
D2 = rinit2();
D3 = rinit3();

global H0
global H1
global H2
global H3
H0=[1 2 3 4];
H1=[1 2 3 4];
H2=[1 2 3 4];
H3=[1 2 3 4];

while size(X, 1) ~=0
    pkt_info=X(1,:);
    rtpkt=struct('sourceid', pkt_info(1), 'destid', pkt_info(2), 'mincost', pkt_info(3:end));
    switch pkt_info(2)
        case 1
            D0=rtupdate0(rtpkt, D0);
        case 2
            D1=rtupdate1(rtpkt, D1);
        case 3
            D2=rtupdate2(rtpkt, D2);
        case 4
            D3=rtupdate3(rtpkt, D3);
    end
    X(1,:)=[];
end

source=input('Enter source node: ');
dest=input('Enter destination node: ');

eval(['minC = ', 'D', num2str(source-1), '(',num2str(source),',',num2str(dest),');'])
disp(['Min cost: ', num2str(minC)])
eval(['P = ', 'H', num2str(source-1), '(',num2str(dest),');'])
disp(['Hop: ', num2str(P)])
while P~=dest
    eval(['P = ', 'H', num2str(P-1), '(',num2str(dest),');'])
    disp(['Hop: ', num2str(P)])
end


function D=rinit0()
    node_id=1;
    costs=[0 1 3 7];
    neighbours=[false, true, true, true];
    for r=1:4
        if neighbours(r)== true
            rtpkt=struct('sourceid', node_id, 'destid', r, 'mincost', costs);
            tolayer2(rtpkt);
        end
    end
    D = [0 1 3 7; 999 999 999 999; 999 999 999 999; 999 999 999 999];
end

function D=rinit1()
    node_id=2;
    costs=[1 0 1 999];
    neighbours=[true, false, true, false];
    for r=1:4
        if neighbours(r)== true
            rtpkt=struct('sourceid', node_id, 'destid', r, 'mincost', costs);
            tolayer2(rtpkt);
        end
    end
    D = [999 999 999 999; 1 0 1 999; 999 999 999 999; 999 999 999 999];
end

function D=rinit2()
    node_id=3;
    costs=[3 1 0 2];
    neighbours=[true, true, false, true];
    for r=1:4
        if neighbours(r)== true
            rtpkt=struct('sourceid', node_id, 'destid', r, 'mincost', costs);
            tolayer2(rtpkt);
        end
    end
    D = [999 999 999 999; 999 999 999 999; 3 1 0 2; 999 999 999 999];
end

function D=rinit3()
    node_id=4;
    costs=[7 999 2 0];
    neighbours=[true, false, true, false];
    for r=1:4
        if neighbours(r)== true
            rtpkt=struct('sourceid', node_id, 'destid', r, 'mincost', costs);
            tolayer2(rtpkt);
        end
    end
    D = [999 999 999 999; 999 999 999 999; 999 999 999 999; 7 999 2 0];
end

function D=rtupdate0(rtpkt, D)
    global H0
    neighbours=[false, true, true, true];
    source_id=rtpkt.sourceid;
    node_id=rtpkt.destid;
    D1=rtpkt.mincost;
    D2=D;
    D(source_id, :)= D1(:);
    for r=1:4
        [D(node_id, r), x]=min(D(:, node_id)+D(:,r));
        if x==node_id
            x=r;
        end
        H0(r)=H0(x);
    end
    flag=0;
    for r=1:4
        if D2(node_id, r)~=D(node_id, r)
            flag=1;
        end
    end
    if flag==0
        return
    end    
    for r=1:4
        if neighbours(r)==true
            rtpkt1=struct('sourceid', node_id , 'destid', r , 'mincost', D(node_id,:));
            tolayer2(rtpkt1);
        end
    end            
end

function D=rtupdate1(rtpkt, D)
    global H1
    neighbours=[true, false, true, false];
    source_id=rtpkt.sourceid;
    node_id=rtpkt.destid;
    D1=rtpkt.mincost;
    D2=D;
    D(source_id, :)= D1(:);
    for r=1:4
        [D(node_id, r), x]=min(D(:, node_id)+D(:,r));
        if x==node_id
            x=r;
        end

        H1(r)=H1(x);
    end
    flag=0;
    for r=1:4
        if D2(node_id, r)~=D(node_id, r)
            flag=1;
        end
    end
    if flag==0
        return
    end    
    for r=1:4
        if neighbours(r)==true
            rtpkt1=struct('sourceid', node_id , 'destid', r , 'mincost', D(node_id,:));
            tolayer2(rtpkt1);
        end
    end            

end

function D=rtupdate2(rtpkt, D)
    global H2
    neighbours=[true, true, false, true];
    source_id=rtpkt.sourceid;
    node_id=rtpkt.destid;
    D1=rtpkt.mincost;
    D2=D;
    D(source_id, :)= D1(:);
    for r=1:4
        [D(node_id, r), x]=min(D(:, node_id)+D(:,r));
        if x==node_id
            x=r;
        end

        H2(r)=H2(x);
    end
    flag=0;
    for r=1:4
        if D2(node_id, r)~=D(node_id, r)
            flag=1;
        end
    end
    if flag==0
        return
    end    
    for r=1:4
        if neighbours(r)==true
            rtpkt1=struct('sourceid', node_id , 'destid', r , 'mincost', D(node_id,:));
            tolayer2(rtpkt1);
        end
    end            
       
end

function D=rtupdate3(rtpkt, D)
    global H3
    neighbours=[true, false, true, false];
    source_id=rtpkt.sourceid;
    node_id=rtpkt.destid;
    D1=rtpkt.mincost;
    D2=D;
    D(source_id, :)= D1(:);
    for r=1:4
        [D(node_id, r), x]=min(D(:, node_id)+D(:,r));
        
        if x==node_id
            x=r;
        end

        H3(r)=H3(x);
    end
    flag=0;
    for r=1:4
        if D2(node_id, r)~=D(node_id, r)
            flag=1;
        end
    end
    if flag==0
        return
    end    
    for r=1:4
        if neighbours(r)==true
            rtpkt1=struct('sourceid', node_id , 'destid', r , 'mincost', D(node_id,:));
            tolayer2(rtpkt1);
        end
    end            
            
end

function [] = tolayer2(rtpkt)
    global X
    pkt_info=[rtpkt.sourceid rtpkt.destid rtpkt.mincost];
    X= [X; pkt_info];
end


%Hop shows the next node to which the jump should be made in the path