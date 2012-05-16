function yaw = toYaw(q0, qi, qj, qk)
    yaw = atan2(2 * (q0.*qk + qi.*qj), (1-2*(qj.*qj + qk.*qk)));