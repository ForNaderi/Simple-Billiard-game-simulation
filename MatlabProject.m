%MATLAB Project
% Forouzan Naderi, 8913603
clear
clc
whitebg([0 1 0]);
axis equal;axis([0 6 0 5]);
t1=0:0.001:2*pi;
h(1)=fill(6-.40*cos(t1),5-.40*sin(t1),'k');
hold on
h(2)=fill(.40*cos(t1),5-.40*sin(t1),'k');
    b1=.07*cos(t1)+2;%ball 1
    a1=.07*sin(t1)+3;%ball 1
    b2=.07*cos(t1)+0.5;%ball 2
    a2=.07*sin(t1)+1.5;%ball 2
fill(a1,b1,'b',a2,b2,'r'),axis equal,axis([0 6 0 5]);
axis equal;axis([0 6 0 5]);
set(gca,'nextplot','replacechildren');
x1(1)=input('please enter x1(meter),(0.1<x1<4.5) : ');
x2(1)=input('please enter x2(meter),(0.1<x2<4.5) : ');
y1(1)=input('please enter y1(meter),(0.1<y1<5.5) : ');
y2(1)=input('please enter y2(meter),(0.1<y2<5.5) : ');
v1(1)=input('please enter v1(m/s)- try greater than 4 : ');
theta1=input('please enter theta1(degree) : ');
theta1=theta1*pi/180;
v2(1)=input('please enter v2(m/s)- greater than 4: ');
theta2=input('please enter theta2(degree) : ');
theta2=theta2*pi/180;
e=0.9;%elastic factor
t=0.01;%step of time
k(1)=0;
w1=0;%score of ball 1
w2=0;%score of ball 2
for i=1:20000
    b1=.07*cos(t1)+x1(i);%parameter(x) of ball 1
    a1=.07*sin(t1)+y1(i);%parameter(y) of ball 1
    b2=.07*cos(t1)+x2(i);%parameter(x) of ball 2
    a2=.07*sin(t1)+y2(i);%parameter(y) of ball 2
    j=i;
    k(i+1)=k(i)+0.01;%time matrix
    fr=0.5;%friction factor
    if v1(i)<=0.1
        v1(i)=0;
        fr=0;
    end
    x1(i+1)=-0.5*fr*cos(theta1)*9.81*t^2+v1(i)*cos(theta1)*t+x1(i);
    y1(i+1)=-0.5*fr*9.81*sin(theta1)*t^2+v1(i)*sin(theta1)*t+y1(i);
    v1(i+1)=abs(v1(i)-9.81*fr*t);
    if (sqrt((5-x1(i+1))^2+(6-y1(i+1))^2))<(0.42)
        disp('u have won');
        w1=1;
        load gong.mat;
        sound(y, Fs);
        break;
    elseif (sqrt((5-x1(i+1))^2+(y1(i+1))^2))<(0.42)
        disp('sorry for u');
        w1=-1;
        break;
    elseif x1(i+1)>=4.90
        n1(i)=i;
        if (n1(i)-n1(i-1))>1
            beep
        v1x=v1(i+1)*cos(theta1)*e;
        v1y=v1(i+1)*sin(theta1);
        v1(i+1)=sqrt(v1x^2+v1y^2);
        theta1=(atan(v1x/v1y))+pi/2;
        if v1y<0
            theta1=(atan(v1x/v1y))-pi/2;
        end
        end
    elseif x1(i+1)<=0.10
        n2(i)=i;
        if (n2(i)-n2(i-1))>1
            beep
        v1n=v1(i+1)*cos(theta1)*e;
        v1t=v1(i+1)*sin(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=(atan(v1n/v1t))+pi/2;
        if v1t<0
            theta1=(atan(v1n/v1t))-pi/2;
        end
        end
    elseif y1(i+1)>=5.90
        n3(i)=i;
        if (n3(i)-n3(i-1))>1
            beep
        v1n=v1(i+1)*sin(theta1)*e;
        v1t=v1(i+1)*cos(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=-(atan(v1n/v1t))+pi;
        if v1t>0
            theta1=-(atan(v1n/v1t));
        end
        end
    elseif y1(i+1)<=0.10
        n4(i)=i;
        if (n4(i)-n4(i-1))>1
            beep
        v1n=v1(i+1)*sin(theta1)*e;
        v1t=v1(i+1)*cos(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=(-atan(v1n/v1t));
        if v1t<0
            theta1=(-atan(v1n/v1t))+pi;
        end
        end
    end
    fr=0.5;
     if v2(i)<0.1
        fr=0;
        v2(i)=0;
        end
         x2(i+1)=-0.5*fr*cos(theta2)*9.81*t^2+v2(i)*cos(theta2)*t+x2(i);
         y2(i+1)=-0.5*fr*9.81*sin(theta2)*t^2+v2(i)*sin(theta2)*t+y2(i);
         v2(i+1)=abs(v2(i)-9.81*fr*t);
        if (sqrt((5-x2(i+1))^2+(6-y2(i+1))^2))<(0.42)
        disp('u have won');
        load gong.mat;
        sound(y, Fs);
        w2=1;
        break;
    elseif (sqrt((5-x2(i+1))^2+(y2(i+1))^2))<(0.42)
        disp('sorry for u');
        w2=-1;
        break;
    elseif x2(i+1)>=4.90
        n5(i)=i;
        if (n5(i)-n5(i-1))>1
            beep
        v2x=v2(i+1)*cos(theta2)*e;
        v2y=v2(i+1)*sin(theta2);
        v2(i+1)=sqrt(v2x^2+v2y^2);
        theta2=(atan(v2x/v2y))+pi/2;
        if v2y<0
            theta2=(atan(v2x/v2y))-pi/2;
        end
        end
    elseif x2(i+1)<=0.10
        n6(i)=i;
        if (n6(i)-n6(i-1))>1
           beep
        v2n=v2(i+1)*cos(theta2)*e;
        v2t=v2(i+1)*sin(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=(atan(v2n/v2t))+pi/2;
        if v2t<0
            theta2=(atan(v2n/v2t))-pi/2;
        end
        end
    elseif y2(i+1)>=5.90
        n7(i)=i;
        if (n7(i)-n7(i-1))>1
            beep
        v2n=v2(i+1)*sin(theta2)*e;
        v2t=v2(i+1)*cos(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=-(atan(v2n/v2t))+pi;
        if v2t>0
            theta2=-(atan(v2n/v2t));
        end
        end
    elseif y2(i+1)<=0.10
        n8(i)=i;
        if (n8(i)-n8(i-1))>1
            beep
        v2n=v2(i+1)*sin(theta2)*e;
        v2t=v2(i+1)*cos(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=(-atan(v2n/v2t));
        if v2t<0
            theta2=(-atan(v2n/v2t))+pi;
        end
        end
        end
    if sqrt((x1(i+1)-x2(i+1))^2+(y1(i+1)-y2(i+1))^2)<=0.14
        n9(i)=i;
        if (n9(i)-n9(i-1))>1
            beep
            beep
        d=(x1(i+1)-x2(i+1))^2+(y1(i+1)-y2(i+1))^2;
        if (x2(i+1)-x1(i+1))==0
            theta=pi/2;
        else
            theta=atan((y2(i)-y1(i))/(x2(i)-x1(i)));
            if theta==0
                theta=pi;
            end
        end
        if theta<0
            theta=-theta;
        end
        v1n=v1(i+1)*cos(theta1)*cos(theta)+v1(i+1)*sin(theta1)*sin(theta);
        v1t=-v1(i+1)*cos(theta1)*sin(theta)+v1(i+1)*sin(theta1)*cos(theta);
        v2n=v2(i+1)*cos(theta2)*cos(theta)+v2(i+1)*sin(theta2)*sin(theta);
        v2t=-v2(i+1)*cos(theta2)*sin(theta)+v2(i+1)*sin(theta2)*cos(theta);
        v1nf=(v1n+v2n-e*abs(v1n-v2n))/2;
        v2nf=(v1n+v2n+e*abs(v1n-v2n))/2;
        if v2nf-v1nf<0
            1
            v1nf=(v1n+v2n+e*abs(v1n-v2n))/2;
            v2nf=(v1n+v2n-e*abs(v1n-v2n))/2;
end
        v1(i+1)=sqrt(v1t^2+v1nf^2);
        v2(i+1)=sqrt(v2t^2+v2nf^2);
        if v1nf>0
        theta1=atan(v1t/(v1nf+0.000001))+theta;
        elseif v1nf<0
            theta1=atan(v1t/(v1nf+0.000001))+theta+pi;
        end
        if v2nf>0
            theta2=atan(v2t/(v2nf+0.000001))+theta;
        elseif v2nf<0
            theta2=atan(v2t/(v2nf+0.000001))+theta+pi;
        end
        x1(i+1)=x1(i);
        x2(i+1)=x2(i);
        y1(i+1)=y1(i);
        y2(i+1)=y2(i);
        end
    end
fill(a1,b1,'b',a2,b2,'r'),axis equal,axis([0 6 0 5]);
F(i)=getframe;
hold off
h(1)=fill(6-.40*cos(t1),5-.40*sin(t1),'k');
hold on
h(2)=fill(.40*cos(t1),5-.40*sin(t1),'k');
if v1(i+1)==0 && v2(i+1)==0
    break;
end
end
if w1~=0 %if ball(1) fall into hole.
    for i=j:20000
        k(i+1)=k(i)+0.01;
        b2=.07*cos(t1)+x2(i);
        a2=.07*sin(t1)+y2(i);
        fr=0.5;
     if v2(i)<0.1
        fr=0;
        v2(i)=0;
        end
         x2(i+1)=-0.5*fr*cos(theta2)*9.81*t^2+v2(i)*cos(theta2)*t+x2(i);
         y2(i+1)=-0.5*fr*9.81*sin(theta2)*t^2+v2(i)*sin(theta2)*t+y2(i);
         v2(i+1)=abs(v2(i)-9.81*fr*t);
        if (sqrt((5-x2(i+1))^2+(6-y2(i+1))^2))<(0.42)
        disp('u have won');
        load gong.mat;
        sound(y, Fs);
        w2=1;
        break;
    elseif (sqrt((5-x2(i+1))^2+(y2(i+1))^2))<(0.42)
        disp('sorry for u');
        load gong.mat;
        sound(y, Fs);
        w2=-1;
        break;
    elseif x2(i+1)>=4.90
        n5(i)=i;
        if (n5(i)-n5(i-1))>1
        v2x=v2(i+1)*cos(theta2)*e;
        v2y=v2(i+1)*sin(theta2);
        v2(i+1)=sqrt(v2x^2+v2y^2);
        theta2=(atan(v2x/v2y))+pi/2;
        if v2y<0
            theta2=(atan(v2x/v2y))-pi/2;
        end
        end
    elseif x2(i+1)<=0.10
        n6(i)=i;
        if (n6(i)-n6(i-1))>1
        v2n=v2(i+1)*cos(theta2)*e;
        v2t=v2(i+1)*sin(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=(atan(v2n/v2t))+pi/2;
        if v2t<0
            theta2=(atan(v2n/v2t))-pi/2
        end
        end
    elseif y2(i+1)>=5.90
        n7(i)=i;
        if (n7(i)-n7(i-1))>1
        v2n=v2(i+1)*sin(theta2)*e;
        v2t=v2(i+1)*cos(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=-(atan(v2n/v2t))+pi;
        if v2t>0
            theta2=-(atan(v2n/v2t));
        end
        end
    elseif y2(i+1)<=0.10
        n8(i)=i;
        if (n8(i)-n8(i-1))>1
        v2n=v2(i+1)*sin(theta2)*e;
        v2t=v2(i+1)*cos(theta2);
        v2(i+1)=sqrt(v2n^2+v2t^2);
        theta2=(-atan(v2n/v2t));
        if v2t<0
            theta2=(-atan(v2n/v2t))+pi;
        end
        end
        end
        fill(a2,b2,'r'),axis equal,axis([0 6 0 5]);
        F(i)=getframe;
        hold off
        h(1)=fill(6-.40*cos(t1),5-.40*sin(t1),'k');
        hold on
        h(2)=fill(.40*cos(t1),5-.40*sin(t1),'k');
        if v2(i+1)==0
           break;
        end
    end
end
if w2~=0 %if ball(2) fall into hole.
    for i=j:20000;
        k(i+1)=k(i)+0.01;
        b1=.07*cos(t1)+x1(i);
        a1=.07*sin(t1)+y1(i);
        fr=0.5;
    if v1(i)<=0.1
        v1(i)=0;
        fr=0;
    end
    x1(i+1)=-0.5*fr*cos(theta1)*9.81*t^2+v1(i)*cos(theta1)*t+x1(i);
    y1(i+1)=-0.5*fr*9.81*sin(theta1)*t^2+v1(i)*sin(theta1)*t+y1(i);
    v1(i+1)=abs(v1(i)-9.81*fr*t);
    if (sqrt((5-x1(i+1))^2+(6-y1(i+1))^2))<(0.42)
        disp('u have won');
        load gong.mat;
        sound(y, Fs);
        w1=1;
        break;
    elseif (sqrt((5-x1(i+1))^2+(y1(i+1))^2))<(0.42)
        disp('sorry for u');
        load gong.mat;
        sound(y, Fs);
        w1=-1;
        break;
    elseif x1(i+1)>=4.90
        n1(i)=i;
        if (n1(i)-n1(i-1))>1
        v1x=v1(i+1)*cos(theta1)*e;
        v1y=v1(i+1)*sin(theta1);
        v1(i+1)=sqrt(v1x^2+v1y^2);
        theta1=(atan(v1x/v1y))+pi/2;
        if v1y<0
            theta1=(atan(v1x/v1y))-pi/2;
        end
        end
    elseif x1(i+1)<=0.10
        n2(i)=i;
        if (n2(i)-n2(i-1))>1
            v1n=v1(i+1)*cos(theta1)*e;
        v1t=v1(i+1)*sin(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=(atan(v1n/v1t))+pi/2;
        if v1t<0
            theta1=(atan(v1n/v1t))-pi/2;
        end
        end
    elseif y1(i+1)>=5.90
        n3(i)=i;
        if (n3(i)-n3(i-1))>1
            v1n=v1(i+1)*sin(theta1)*e;
        v1t=v1(i+1)*cos(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=-(atan(v1n/v1t))+pi;
        if v1t>0
            theta1=-(atan(v1n/v1t));
        end
        end
    elseif y1(i+1)<=0.10
        n4(i)=i;
        if (n4(i)-n4(i-1))>1
            v1n=v1(i+1)*sin(theta1)*e;
        v1t=v1(i+1)*cos(theta1);
        v1(i+1)=sqrt(v1n^2+v1t^2);
        theta1=(-atan(v1n/v1t));
        if v1t<0
            theta1=(-atan(v1n/v1t))+pi;
        end
        end
    end
        fill(a1,b1,'b'),axis equal,axis([0 6 0 5]);
        F(i)=getframe;
        hold off
        h(1)=fill(6-.40*cos(t1),5-.40*sin(t1),'k');
        hold on
        h(2)=fill(.40*cos(t1),5-.40*sin(t1),'k');
        if v1(i+1)==0
           break;
        end
    end
end 
axis equal;axis([0 6 0 5]);
movieview(F)