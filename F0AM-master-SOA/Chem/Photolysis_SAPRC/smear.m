%% SUB-FUNCTION FOR INTEGRAL CONVOLUTION
% function yg = smear(x,y,xgl,xgu)
% Convolutes a cross section or quantum yield to another wavelength resolution
% by trapezoidal integration over wavelength and then re-destributing evenly over the output grid.
% stolen/borrowed directly from the TUV routine numer.f/interp2
    function yg = smear(x,y,xgl,xgu)
        
        area = 0;
        for k=1:length(x)-1
            if x(k+1)<xgl || x(k)>xgu %outside window
                continue
            end
            
            a1 = max(x(k),xgl);
            a2 = min(x(k+1),xgu);
            
            slope = (y(k+1) - y(k))/(x(k+1) - x(k));
            b1 = y(k) + slope*(a1 - x(k));
            b2 = y(k) + slope*(a2 - x(k));
            area = area + (a2 - a1)*(b2 + b1)/2;
        end
        yg = area./(xgu-xgl);
    end