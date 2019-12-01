clc
close all
clear all

%% Section 2: Modeling Small Population Epidemics with Markov Chains

    % 2.1 Questions
        % #2
        P_s = 0.7;
        P_e = 0.4;
        P_i = 1;
        P_r = 0.8;

        SEIR_trans_matr = [P_s          P_e              0            (1 - P_r)
                           (1 - P_s)    0                0            0
                           0            0.5*(1 - P_e)    (1 - P_i)    0
                           0            0.5*(1 - P_e)    P_i          P_r];
        
        disp("Transition matrix for Markov Chain of the SEIR model:");
        disp(SEIR_trans_matr);
        
        
        % #3
        sv_q2_3 = [0; 1; 0; 0];     % exposed state vector
        
        probability_q2_3 = SEIR_trans_matr * sv_q2_3;
        
        disp("Probability exposed individual is in each state after one day:");
        disp(probability_q2_3);
        
        
        % #4
        sv_q2_4 = [1; 0; 0; 0];     % susceptible state vector
        
        five_iter_SEIR_trans_matr = SEIR_trans_matr;
        for n = 1:4
            five_iter_SEIR_trans_matr = five_iter_SEIR_trans_matr * SEIR_trans_matr;
        end
        
        probability_q2_4 = five_iter_SEIR_trans_matr * sv_q2_4;
        
        disp("Probability susceptible individual is in each state after five days:");
        disp(probability_q2_4);
        
        
        
        
        