% cont = 0;
% edgelist = {};
% id = 0;
% for i=1:577
%     switch(B.data15(i))
%         case B.data1(i)
%             idx = [3,5,7,9,11,13];
%             id = 1;
%             %break;
%         case B.data3(i)
%             idx = [1,5,7,9,11,13];
%             id = 3;
%             %break;
%         case B.data5(i)
%             idx = [3,1,7,9,11,13];
%             id = 5;
%             %break;
%         case B.data7(i)
%             idx = [3,5,1,9,11,13];
%             id = 7;
%             %break;
%         case B.data9(i)
%             idx = [3,5,7,1,11,13];
%             id = 9;
%             %break
%         case B.data11(i)
%             idx = [3,5,7,9,1,13];
%             id = 11;
%             %break;
%         case B.data13(i)
%             idx = [3,5,7,9,11,1];
%             id = 13;
%             %break;
%     end
%     for j=1:6
%         a = table2cell(B(i,idx(j))); a = [a{:}];
%         if(a ~= "")
%             edgelist{cont+1,1} = B.data15(i); %Elemento principal
%             a = table2cell(B(i,idx(j))); a = [a{:}];
%             edgelist{cont+1,2} = a; %Elemento secundario
%             a = table2cell(B(i,id+1)); a = [a{:}];
%             edgelist{cont+1,3} = a; %Porcentaje del elemento principal
% 
%             a = table2cell(B(i,idx(j)+1)); a = [a{:}];
%             edgelist{cont+1,4} = a; %Porcentaje del elemento secundario
%             edgelist{cont+1,5} = B.data17(i); %TFR del elemento principal
%             cont = cont+1; 
%         end
%     end
% end

%%PASO 2
% %E = cell2table(edgelist);
% %edgelist2 = zeros(1429,5);
% for i=1:45
%     idx = find(E.edgelist1 == elementosDiferentes(i,1));
% 
% 
% 
%     for j=1:size(idx,1)
%         edgelist2(idx(j),1) = str2num(elementosDiferentes(i,2));
%     end
% end


% %PASO 3
% for j=1:1561
%         a = cell2table(edgelist(j,3));
%         edgelist2(j,3) = a.Var1;
% end

%PASO 4: Media

% for i=1:1561
%     numRep = 1;
%     for j=i+1:1561
%         if edgelist2(i,1) == edgelist2(j,1) && edgelist2(i,2) == edgelist2(j,2)
%             numRep = numRep+1; %Incrementar el numero de repeticiones
%             edgelist2(i,5) = edgelist2(i,5) + edgelist2(j,5); %Sumar
%             edgelist2(j,1) = 0; edgelist2(j,2) = 0; edgelist2(j,3) = 0; edgelist2(j,4) = 0; edgelist2(j,5) = 0; %Borrar
%         end
%     end
%     edgelist2(i,5) = edgelist2(i,5)/numRep;
% end

%PASO 4.1: Crear otro edgelist mas denso, y hacemos media

% for i=1:1561
%     edgelist3(i*2-1,1) = edgelist2(i,1);
%     edgelist3(i*2-1,2) = edgelist2(i,2);
%     edgelist3(i*2-1,3) = (edgelist2(i,3)*edgelist2(i,5))/100;
% 
%     edgelist3(i*2,1) = edgelist2(i,2);
%     edgelist3(i*2,2) = edgelist2(i,1);
%     edgelist3(i*2,3) = (edgelist2(i,4)*edgelist2(i,5))/100;
% end

% for i=1:3122
%     numRep = 1;
%     for j=i+1:3122
%         if edgelist3(i,1) == edgelist3(j,1) && edgelist3(i,2) == edgelist3(j,2)
%             numRep = numRep+1; %Incrementar el numero de repeticiones
%             edgelist3(i,3) = edgelist3(i,3) + edgelist3(j,3); %Sumar
%             edgelist3(j,1) = 0; edgelist3(j,2) = 0; edgelist3(j,3) = 0;  %Borrar
%         end
%     end
%     edgelist3(i,3) = edgelist3(i,3)/numRep;
% end

% PASO 5: crear W

W = zeros(45);
for i=1:3122
if edgelist3(i,1) > 0
W(edgelist3(i,1),edgelist3(i,2)) = edgelist3(i,3);
end
end