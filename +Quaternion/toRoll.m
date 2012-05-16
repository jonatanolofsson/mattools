function roll = toRoll(q0, qi, qj, qk)
    roll = atan2(2 * (q0.*qi + qj.*qk), (1-2*(qi.*qi + qj.*qj)));