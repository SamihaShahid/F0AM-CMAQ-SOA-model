function nguess = soabisect(lowerb, upperb, nonvolmol, n, cstaratt, totsemivol, mlwt)
    fractol = 1e-6;
    abstol = 1e-8;

    % Local variables
    nguess = upperb;
    iter = 0;

    % Store current lower and upper bound, evaluate at lower bound
    lower = lowerb;
    upper = upperb;
    flower = soaequation(nonvolmol, n, cstaratt, totsemivol, mlwt, lowerb);
    fupper = soaequation(nonvolmol, n, cstaratt, totsemivol, mlwt, upperb);
    % disp(flower);
    % disp(fupper);
    while true
        if flower * fupper > 0
            error("Error: no solution between bounds in soa bisection");
        end
        iter = iter + 1;
        oldn = nguess;
        nguess = (lower + upper) / 2.0;
        fnguess = soaequation(nonvolmol, n, cstaratt, totsemivol, mlwt, nguess);
        ea = abs(nguess - oldn) / nguess;
        if (nguess ~= 0 && ea < fractol) || ea < abstol
            break;
        end
        test = flower * fnguess;
        if test < 0
            upper = nguess;
            fupper = fnguess;
        else
            lower = nguess;
            flower = fnguess;
        end
    end
end
