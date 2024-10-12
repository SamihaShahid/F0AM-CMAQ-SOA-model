function eqnerror = soaequation(nonvmol, n, cstar, semivol, mlwt, currentN)
    %% Samiha Binte Shahid; email- sbint003@ucr.edu
    % Evaluates the function of total aerosol moles, N
    % Function evaluates to zero at equilibrium
    
    % Local variables
    temptot = 0.0;
    for i = 1:n
        % fprintf('%f %f %f %f\n', semivol(i), cstar(i), mlwt(i), currentN);
        temptot = temptot + semivol(i) / (cstar(i) + mlwt(i) * currentN);
    end
    eqnerror = temptot + nonvmol / currentN - 1.0;
end
