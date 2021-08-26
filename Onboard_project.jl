# FLOW Lab Onboarding Project Code
# Author: Cameron Van Dyke
# Date created: 8/20/21
# Version History:
# Version 1 8/20/21
#-------------------------------------------------

# Position arrays, hold the x and y position of each vortex
global P1 = [0, -0.5]
global P2 = [0, 0.5]
global P3 = [1, 0.5]
global P4 = [1, -0.5]

# Velocity arrays, hold the x and y values of the instantaneous velocity of each vortex
global V1 = [0, 0]
global V2 = [0, 0]
global V3 = [0, 0]
global V4 = [0, 0]

# Arrays representing the strength of each vortex. Strength of the vortex is only manifest in the z-direction (vertical from plane).
T1 = [0; 0; -1]
T2 = [0; 0; 1]
T3 = [0, 0, 1]
T4 = [0, 0, -1]

# Change in time between steps
delta_t = 0.0001

# Counter variable for while loop
global s = 0


# Vortex arrays holding positional x and y data for each vortex for each timestep.
Vortex1_x = [0.0]
Vortex2_x = [0.0]
Vortex3_x = [1.0]
Vortex4_x = [1.0]

Vortex1_y = [-0.5]
Vortex2_y = [0.5]
Vortex3_y = [0.5]
Vortex4_y = [-0.5]

# Unit vector initialization.
r_unit = Vector{Real}(undef, 3)

# Specify Linear Algebra is being used
using LinearAlgebra

while s < 30
    # Vortex 1
    # Determine velocities induced by other vortices

   # print("Iteration Number: ")
   # print(s)

    # Velocity induced by Vortex 2
    r_x = P1[1] - P2[1]
    r_y = P1[2] - P2[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    global V1 = (cross(T2, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 3
    r_x = P1[1] - P3[1]
    r_y = P1[2] - P3[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V1 = V1 + (cross(T3, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 4
    r_x = P1[1] - P4[1]
    r_y = P1[2] - P4[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V1 = V1 + (cross(T4, r_unit))/(2 * pi * r_mag)

    # Determine new position using components of velocity
    new_position = [(P1[1] + V1[1] * delta_t), (P1[2] + V1[2] * delta_t)]

    append!(Vortex1_x, new_position[1])
    append!(Vortex1_y, new_position[2])

    global P1 = new_position

  #  print(new_position)
  #  print(Vortex1_x)
  #  print(P1)

    # Vortex 2
    # Determine velocities induced by other vortices

    # Velocity induced by Vortex 1
    r_x = P2[1] - P1[1]
    r_y = P2[2] - P1[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    global V2 = (cross(T1, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 3
    r_x = P2[1] - P3[1]
    r_y = P2[2] - P3[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V2 = V2 + (cross(T3, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 4
    r_x = P2[1] - P4[1]
    r_y = P2[2] - P4[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V2 = V2 + (cross(T4, r_unit))/(2 * pi * r_mag)

    # Determine new position using components of velocity
    new_position = [(P2[1] + V2[1] * delta_t), (P2[2] + V2[2] * delta_t)]

    append!(Vortex2_x, new_position[1])
    append!(Vortex2_y, new_position[2])

    global P2 = new_position

    # Vortex 3
    # Determine velocities induced by other vortices
    
    # Velocity induced by Vortex 1
    r_x = P3[1] - P1[1]
    r_y = P3[2] - P1[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    global V3 = (cross(T1, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 2
    r_x = P3[1] - P2[1]
    r_y = P3[2] - P2[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V3 = V3 + (cross(T2, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 4
    r_x = P3[1] - P4[1]
    r_y = P3[2] - P4[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V3 = V3 + (cross(T4, r_unit))/(2 * pi * r_mag)

    # Determine new position using components of velocity
    new_position = [(P3[1] + V3[1] * delta_t), (P3[2] + V3[2] * delta_t)]

    append!(Vortex3_x, new_position[1])
    append!(Vortex3_y, new_position[2])

    global P3 = new_position

    # Vortex 4
    # Determine velocities induced by other vortices

    # Velocity induced by Vortex 1
    r_x = P4[1] - P1[1]
    r_y = P4[2] - P1[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    global V4 = (cross(T1, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 2
    r_x = P4[1] - P2[1]
    r_y = P4[2] - P2[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V4 = V4 + (cross(T2, r_unit))/(2 * pi * r_mag)

    # Velocity induced by Vortex 3
    r_x = P4[1] - P3[1]
    r_y = P4[2] - P3[2]

    r_mag = sqrt((r_x)^2 + (r_y)^2)

    r_unit[1] = r_x/r_mag
    r_unit[2] = r_y/r_mag
    r_unit[3] = 0

    V4 = V4 + (cross(T3, r_unit))/(2 * pi * r_mag)

    # Determine new position using components of velocity
    new_position = [(P4[1] + V4[1] * delta_t), (P4[2] + V4[2] * delta_t)]

    append!(Vortex4_x, new_position[1])
    append!(Vortex4_y, new_position[2])

    global P4 = new_position

    # Change counter for next iteration.
    global s = s + delta_t

end

# Plot the results using the Vortex Arrays.
using Plots

plot(
    Vortex1_x, Vortex1_y,
    
    label = "Vortex 1",

    size=(800, 600),

    ylabel = "y-position (units)",
    xlabel = "x-position (units)",

    title = "Leapfrogging Vortices"

    )
plot!(
    Vortex2_x, Vortex2_y,
    
    label = "Vortex 2"
    
    )
plot!(
    Vortex3_x, Vortex3_y,
    
    label = "Vortex 3"

    )
plot!(
    Vortex4_x, Vortex4_y,
    
    label = "Vortex 4"

    )