function pitch = toPitch(q0, qi, qj, qk)
    pitch = asin(2*(q0.*qj - qk.*qi));