close all 

%IMPRIMIR Y PREGUNTAR VALORES DE LOS GRADOS--------------------------------
prompt= 'Introduzca el valor (grados) de la rotacion en x (phi):';
phiDeg = input(prompt);
prompt= 'Introduzca el valor (grados) de la rotacion en y (theta):';
thetaDeg = input(prompt);
prompt= 'Introduzca el valor(grados) de la rotacion en y (psi):';
psiDeg = input(prompt);

%CONVERSION DE LOS GRADOS A RADIANES---------------------------------------
phiRad= deg2rad(phiDeg);
thetaRad= deg2rad(thetaDeg);
psiRad= deg2rad(psiDeg);

%SE GENERA UN FOR ANIDADO PARA QUE EN UN INTERVALO DE TIEMPO REALICE LA
%ROTACION UNA PASO A LA VEZ Y PODAMOS VIZUALIZAR LA ROTACION 
for t=0:0.01:phiRad
    clf
    for te=0:0.01:thetaRad
        clf
        for ta=0:0.01:psiRad
            clf

%PLANO CARTECIANO---------------------------------------------------------             
line([-9 9],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-9 9],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-9 9],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul

%COORDENADAS--------------------------------------------------------------
p1=[0 0 0];  
p2=[7 0 0]; 
p3=[7 3 0]; 
p4=[0 3 0]; 
p5=[0 0 2]; 
p6=[0 3 2]; 
p7=[7 0 2]; 
p8=[7 3 2]; 

%LINEAS DEL PLANO
%CUADRO-------------------------------------------------------------------
grid on 
imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

%PARA UNA VISTA ISOMETRICA-------------------------------------------------
view(120,30)

%MATRIZ DE ROTACIONES------------------------------------------------------
Rx= [1 0 0;0 cos(t) -sin(t); 0 sin(t) cos(t)];
Ry= [cos(te) 0 sin(te) ;0 1 0; -sin(te) 0 cos(te) ];
Rz= [cos(ta) -sin(ta) 0;sin(ta) cos(ta) 0; 0 0 1];
Rt = Rz*Ry*Rx;

%SE REALIZÓ LA ANIMACIÓN DE LAS COORDENADAS EN EL EJE X--------------------
p1 = Rx*p1'; 
p2 = Rx*p2';
p3 = Rx*p3';
p4 = Rx*p4';
p5 = Rx*p5';
p6 = Rx*p6';
p7 = Rx*p7';
p8 = Rx*p8';
imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

%SE REALIZÓ LA ANIMACIÓN DE LAS COORDENADAS EN EL EJE Y--------------------
p1 = Ry*p1; 
p2 = Ry*p2;
p3 = Ry*p3;
p4 = Ry*p4;
p5 = Ry*p5;
p6 = Ry*p6;
p7 = Ry*p7;
p8 = Ry*p8;
imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

%SE REALIZÓ LA ANIMACIÓN DE LAS COORDENADAS EN EL EJE Z--------------------
p1 = Rz*p1;  
p2 = Rz*p2;
p3 = Rz*p3;
p4 = Rz*p4;
p5 = Rz*p5;
p6 = Rz*p6;
p7 = Rz*p7;
p8 = Rz*p8;
imprimir(p1,p2,p3,p4,p5,p6,p7,p8)
pause (0.01)
        end
    end
end