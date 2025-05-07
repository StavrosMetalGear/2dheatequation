%% 2D Heat Equation Simulation
clc; clear; close all

% Parameters
Lx = 10;               % Length in x-direction
Ly = 10;               % Length in y-direction
dx = 0.1; dy = dx;     % Grid spacing
dt = 0.001;            % Time step
alpha = 0.1;           % Thermal diffusivity
Tf = 1;                % Final time

x = 0:dx:Lx;
y = 0:dy:Ly;
t = 0:dt:Tf;

Nx = length(x);
Ny = length(y);
Nt = length(t);

% Stability condition check
s = alpha * dt / dx^2;
if s > 0.25
    warning('Stability condition not met: reduce dt or increase dx.');
end

% Initial temperature distribution: hot spot in the center
T = zeros(Nx, Ny, Nt);
x0 = Lx/2;
y0 = Ly/2;
for i = 1:Nx
    for j = 1:Ny
        T(i,j,1) = 100 * exp(-((x(i)-x0)^2 + (y(j)-y0)^2));
    end
end

% Time stepping
for n = 1:Nt-1
    for i = 2:Nx-1
        for j = 2:Ny-1
            T(i,j,n+1) = T(i,j,n) + s * ( ...
                T(i+1,j,n) + T(i-1,j,n) + ...
                T(i,j+1,n) + T(i,j-1,n) - 4*T(i,j,n) );
        end
    end
end

% Visualization
[XX, YY] = meshgrid(x,y);
fh = figure(); fh.WindowState = 'maximized';
video = true;

if video
    writerObj = VideoWriter('output_video.avi');
    open(writerObj);
end

for n = 1:Nt
    surf(XX, YY, T(:,:,n)', 'EdgeColor', 'none')
    zlim([0 100]); view(2); colorbar
    title(sprintf('Heat Diffusion at t = %.3f', t(n)))
    drawnow
    
    if video
        writeVideo(writerObj, getframe(gcf));
    end
end

if video
    close(writerObj);
end