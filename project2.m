clc
close all
clear all

%% Section 2: Modeling Small Population Epidemics with Markov Chains

    % 2.1 Questions
        % #2
        P_s = 0.7;
        P_e = 0.4;
        P_i = 1.0;
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
        
        five_iter_SEIR_trans_matr = SEIR_trans_matr ^ 5
        
        probability_q2_4 = five_iter_SEIR_trans_matr * sv_q2_4;
        
        disp("Probability susceptible individual is in each state after five days:");
        disp(probability_q2_4);
        
        
        
        
%% Section 3: Stationary Probability Distributions

    % 3.1 Questions
        % #1
            % (a)
            sv_s = [1; 0; 0; 0];     % susceptible state vector
            probability_s = zeros(1, 31);
            probability_e = zeros(1, 31);
            probability_i = zeros(1, 31);
            probability_r = zeros(1, 31);

            probability_step = zeros(4, 1);
            for n = 1:31
                probability_step = (SEIR_trans_matr ^ n) * sv_s;
                probability_step = probability_step / sum(probability_step);
                probability_s(n) = probability_step(1);
                probability_e(n) = probability_step(2);
                probability_i(n) = probability_step(3);
                probability_r(n) = probability_step(4);
            end

            figure(1)
            hold on
            step_count = linspace(1, 31, 31);
            plot(step_count, probability_s, "-r");
            plot(step_count, probability_e, "-g");
            plot(step_count, probability_i, "-b");
            plot(step_count, probability_r, "-k");
            legend("Susceptible", "Exposed", "Infected", "Recovered");
            title("Probability of being in each state on a given day");
            xlabel("Days");
            ylabel("Probability");
            xlim([1, 31]);
            hold off
            
            
            % (b)
            stat_dist = [probability_s(31); probability_e(31); probability_i(31); probability_r(31)];
            
            disp("Stationary distribution:");
            disp(stat_dist);
            
            
        % #2
            % (a)
            p2_sv_s = [0.15; 0.85; 0; 0];
            p2_probability_s = zeros(1, 31);
            p2_probability_e = zeros(1, 31);
            p2_probability_i = zeros(1, 31);
            p2_probability_r = zeros(1, 31);

            p2_probability_step = zeros(4, 1);
            for n = 1:31
                p2_probability_step = (SEIR_trans_matr ^ n) * p2_sv_s;
                p2_probability_step = p2_probability_step / sum(p2_probability_step);
                p2_probability_s(n) = p2_probability_step(1);
                p2_probability_e(n) = p2_probability_step(2);
                p2_probability_i(n) = p2_probability_step(3);
                p2_probability_r(n) = p2_probability_step(4);
            end

            figure(2)
            hold on
            plot(step_count, p2_probability_s, "-r");
            plot(step_count, p2_probability_e, "-g");
            plot(step_count, p2_probability_i, "-b");
            plot(step_count, p2_probability_r, "-k");
            legend("Susceptible", "Exposed", "Infected", "Recovered");
            title("Probability of being in each state on a given day");
            xlabel("Days");
            ylabel("Probability");
            xlim([1, 31]);
            hold off
            
            
            % (b)
            p2_stat_dist = [p2_probability_s(31); p2_probability_e(31); p2_probability_i(31); p2_probability_r(31)];
            
            disp("Stationary distribution:");
            disp(p2_stat_dist);
            
            
        % #4
            % (a)
            % I don't know
            
            
            % (b)
            % I don't know
            
            
            % (c)
            % I don't know
            
            
            % (d)
            % I don't know
            
            
        % #5
            % (b)
            P_Im = 1.0;
            
            SEIR_Im_trans_matr = [P_s          P_e              0            0.5*(1 - P_r)    0
                                  (1 - P_s)    0                0            0                0
                                  0            0.5*(1 - P_e)    (1 - P_i)    0                0
                                  0            0.5*(1 - P_e)    P_i          P_r              0
                                  0            0                0            0.5*(1 - P_r)    P_Im];
                              
            disp("Transition matrix for Markov Chain of the SEIR-Im model:");
            disp(SEIR_Im_trans_matr);
            
            
            % (c)
            p3_sv_s = [1; 0; 0; 0; 0];
            p3_probability_s = zeros(1, 250);
            p3_probability_e = zeros(1, 250);
            p3_probability_i = zeros(1, 250);
            p3_probability_r = zeros(1, 250);
            p3_probability_Im = zeros(1, 250);

            p3_probability_step = zeros(5, 1);
            for n = 1:250
                p3_probability_step = (SEIR_Im_trans_matr ^ n) * p3_sv_s;
                p3_probability_step = p3_probability_step / sum(p3_probability_step);
                p3_probability_s(n) = p3_probability_step(1);
                p3_probability_e(n) = p3_probability_step(2);
                p3_probability_i(n) = p3_probability_step(3);
                p3_probability_r(n) = p3_probability_step(4);
                p3_probability_Im(n) = p3_probability_step(5);
            end

            figure(4)
            hold on
            step_count_250 = linspace(1, 250, 250);
            plot(step_count_250, p3_probability_s, "-r");
            plot(step_count_250, p3_probability_e, "-g");
            plot(step_count_250, p3_probability_i, "-b");
            plot(step_count_250, p3_probability_r, "-k");
            plot(step_count_250, p3_probability_Im, "-m");
            legend("Susceptible", "Exposed", "Infected", "Recovered", "Immune");
            title("Probability of being in each SEIR-Im state on a given day");
            xlabel("Days");
            ylabel("Probability");
            xlim([1, 250]);
            hold off
            
            SEIR_Im_stat_dist = [p3_probability_s(250)
                                 p3_probability_e(250)
                                 p3_probability_i(250) 
                                 p3_probability_r(250)
                                 p3_probability_Im(250)];
            
            disp("Stationary distribution:");
            disp(SEIR_Im_stat_dist);
            
            
            
        