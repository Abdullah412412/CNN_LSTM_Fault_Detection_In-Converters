clc
clear all

%Matrixes
A = [];
B = [];

%No fault simulation
for i = 1:5
    sim("One_level_boost_no_fault.slx");
    disp('Sim done! Healthy');
        for k = 1:18000
           if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
           end
        end
    
end

%%Diode fault simulation
%shot circuit
for i = 1:5
    sim("One_level_boost_diode_shortcircuit.slx");
    disp('Sim done! SCD');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end
%Open circuit
for i = 1:5
    sim("One_level_boost_diode_opencircuit.slx");
    disp('Sim done! OCD');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end

%%IGBT fault simulation
%Short circuit
for i = 1:5
    sim("One_level_boost_igbt_shortcircuit.slx");
    disp('Sim done! SCI');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end
%Open circuit
for i = 1:5
    sim("One_level_boost_igbt_opencircuit.slx");
    disp('Sim done! OCI');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end

%%Capacitor fault simulation
%Open circuit
for i = 1:5
    sim("One_level_boost_capacitor_opencircuit.slx");
    disp('Sim done! OCC');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end

%Load fault simulation
%Short circuit
for i = 1:5
    sim("One_level_boost_load_shortcircuit.slx");
    disp('Sim done! SCL');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end
%Open circuit
for i = 1:5
    sim("One_level_boost_load_opencircuit.slx");
    disp('Sim done! OCL');
      for k = 1:18000
         if mod(k,200)==0
                A = [A;transpose(ans.i_out(k-199:k)),transpose(ans.v_out(k-199:k)),transpose(ans.i_out_2(k-199:k))];
         end
      end
end

%Append labels
for i = 1:8
    B = [B;zeros(450,1)+i];     
end

%export txt file
A = [B,A];
csvwrite('one_boost_test_final.txt',A);